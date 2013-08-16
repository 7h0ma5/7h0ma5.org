{-# LANGUAGE OverloadedStrings #-}
import Data.Monoid (mappend)
import Hakyll

main :: IO ()
main = hakyll $ do
    match ("js/*" .||. "images/*" .||. "robots.txt") $ do
        route idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route idRoute
        compile compressCssCompiler

    match (fromList ["blogroll.md", "impressum.md"]) $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    match postPattern $ do
        route $ postRoute
        compile $ pandocCompiler
          >>= saveSnapshot "content"
          >>= loadAndApplyTemplate "templates/post.html"    postCtx
          >>= loadAndApplyTemplate "templates/default.html" postCtx
          >>= relativizeUrls

    match "archive.html" $ do
        route idRoute
        compile $ do
          pandocCompiler
          posts <- recentFirst =<< loadAll postPattern
          let archiveCtx =
                listField "posts" postCtx (return posts) `mappend`
                defaultContext

          getResourceBody
            >>= applyAsTemplate archiveCtx
            >>= loadAndApplyTemplate "templates/default.html" archiveCtx
            >>= relativizeUrls


    match "index.html" $ do
        route idRoute
        compile $ do
            pandocCompiler
            posts <- fmap (take 5) . recentFirst =<< loadAll postPattern
            let indexCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    constField "title" "Home"                `mappend`
                    defaultContext

            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
                >>= relativizeUrls

    match "templates/*" $ compile templateCompiler

    create ["atom.xml"] $ do
      route idRoute
      compile $ do
        let feedCtx = postCtx `mappend` bodyField "description"
        posts <- fmap (take 10) . recentFirst =<<
            loadAllSnapshots postPattern "content"
        renderAtom feedConfiguration feedCtx posts

postPattern = (fromGlob "posts/**")

postRoute = gsubRoute "posts/" (const "") `composeRoutes` setExtension "html"

postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

feedConfiguration :: FeedConfiguration
feedConfiguration = FeedConfiguration
    { feedTitle       = "7h0ma5.org"
    , feedDescription = ""
    , feedAuthorName  = "Thomas Gatzweiler"
    , feedAuthorEmail = ""
    , feedRoot        = "http://www.7h0ma5.org"
    }
