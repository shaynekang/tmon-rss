require 'nokogiri'
require 'open-uri'

module TmonRss
  class Crawler
    DEFAULT_URL = "http://www.ticketmonster.co.kr"

    def initialize(url)
      @url = url
      @doc = Nokogiri::HTML(open(@url))
    end

    def title
      @doc.at_css('title').content.strip
    end

    def url
      @url
    end

    def deals
      @doc.css('li.dealli').map do |deal|
        subject = deal.at_css('a.subject')

        title = subject.content
        url = subject['href']

        price = deal.at_css('p.sale em').content
        price = price.split(',').join.to_i

        description = deal.at_css('p.summary').content.strip

        OpenStruct.new({
          title: title,
          price: price,
          url: DEFAULT_URL + url,
          description: description
        })
      end
    end
  end
end