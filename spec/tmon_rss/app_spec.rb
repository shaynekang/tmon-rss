require 'spec_helper'
require 'rss'

require './lib/tmon_rss/app'

describe TmonRss::App do
  it "should crawl Tmon and return rss without deal" do
    url = "./spec/fixtures/no_deal.html"

    app = TmonRss::App.new
    result = app.run(url)

    rss = RSS::Parser.parse(result)
    rss.channel.title.should == "티켓몬스터 제주도 여행 RSS"
    rss.channel.description.should == "티몬 :: 비교할수록 쇼핑은 티몬!"
    rss.channel.link.should == url
  end

  it "should crawl Tmon and return rss with one deal" do
    url = "./spec/fixtures/one_deal.html"

    app = TmonRss::App.new
    result = app.run(url)

    rss = RSS::Parser.parse(result)
    item = rss.items.first

    item.title.should == "[제주] 김포/부산出,에어부산 제주 편도항공권 - 14900원"
    item.link.should == "http://www.ticketmonster.co.kr/deal/48315957/101737/101765"
    item.description.should == "1~2월 초특가 찬스 ! / 01.09~02.28"
  end

  it "should crawl Tmon and return rss with two deals" do
    url = "./spec/fixtures/two_deal.html"

    app = TmonRss::App.new
    result = app.run(url)

    rss = RSS::Parser.parse(result)
    item = rss.items.last

    File.open('rss.xml', 'w') do |f|
      f.write(rss)
    end

    item.title.should == "[제주] 김포出,아시아나+풍림리조트+렌터카3일 - 116000원"
    item.link.should == "http://www.ticketmonster.co.kr/deal/47853325/101737/101765"
    item.description.should == "[유류+택스]32,200원별도 / 01.09~02.16"
  end
end

