require 'rss/maker'

module TmonRss
  class Builder
    def build(data)
      RSS::Maker.make("2.0") do |maker|
        maker.channel.title = "티켓몬스터 제주도 여행 RSS"
        maker.channel.description = data.title
        maker.channel.link = data.url

        data.deals.each do |deal|
          maker.items.new_item do |item|
            item.title = "#{deal.title} - #{deal.price}원"
            item.link = deal.url
            item.description = deal.description
          end
        end
      end.to_s
    end
  end
end