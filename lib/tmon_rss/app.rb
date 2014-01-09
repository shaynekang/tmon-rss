require './lib/tmon_rss/crawler'
require './lib/tmon_rss/builder'

module TmonRss
  class App
    def run(url)
      crawler = TmonRss::Crawler.new(url)
      builder = TmonRss::Builder.new

      builder.build(crawler)
    end
  end
end
