module WikipediaHtmlSanitize
  class Sanitize
    def initialize(slug, conn=nil)
      @slug = slug
      @conn = conn || default_conn
    end

    def default_conn
      Faraday.new(url: "http://en.wikipedia.org/")
    end

    def sanitized_html
      html = @conn.get("/wiki/#{@slug}").body
      ::Sanitize.document(html, ::Sanitize::Config::RELAXED)
    end
  end
end
