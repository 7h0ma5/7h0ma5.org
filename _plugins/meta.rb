module Jekyll
  module PageMetaFilter
    def build(page)
      meta = []

      meta << ["author", "Thomas Gatzweiler"]
      meta << ["og:article:author", "Thomas Gatzweiler"]
      meta << ["og:locale", "de_DE"]
      meta << ["og:site_name", "7h0ma5.org"]
      meta << ["og:url", "http://7h0ma5.org" + page["url"]]

      if page["title"]
        meta << ["og:title", page["title"]]
      end

      if page["image"]
        meta << ["og:image", page["image"]]
      end

      if page["tags"]
        meta << ["keywords", page["tags"].join(",")]
        page["tags"].each {|tag| meta << ["og:article:tag", tag]}
      end

      if page["date"]
        date = page["date"].strftime '%Y-%m-%dT%H:%M:%S%z'

        meta << ["og:article:modified", date]
        meta << ["og:type", "article"]
      end

      return meta
    end

    def page_meta(page)
      meta = self.build(page)

      res = ""
      meta.each {|name,content|
        if name.start_with?("og:")
          res += "<meta property=\"#{name}\" content=\"#{content}\" />\n"
        else
          res += "<meta name=\"#{name}\" content=\"#{content}\" />\n"
        end
      }

      return res
    end
  end
end

Liquid::Template.register_filter(Jekyll::PageMetaFilter)
