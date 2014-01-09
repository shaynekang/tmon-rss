require 'spec_helper'
require './lib/tmon_rss/crawler'

describe TmonRss::Crawler do
  it "should crawl Tmon without deal" do
    url = "./spec/fixtures/no_deal.html"

    crawler = TmonRss::Crawler.new(url)

    crawler.title.should == "티몬 :: 비교할수록 쇼핑은 티몬!"
    crawler.url.should == url
  end

  it "should crawl Tmon with one deal" do
    url = "./spec/fixtures/one_deal.html"

    crawler = TmonRss::Crawler.new(url)
    deal = crawler.deals.first

    deal.title.should == "[제주] 김포/부산出,에어부산 제주 편도항공권"
    deal.price.should == 14900
    deal.url.should == "http://www.ticketmonster.co.kr/deal/48315957/101737/101765"
    deal.description.should == "1~2월 초특가 찬스 ! / 01.09~02.28"
  end

  it "should crawl Tmon with two deals" do
    url = "./spec/fixtures/two_deal.html"

    crawler = TmonRss::Crawler.new(url)
    deal = crawler.deals.last

    deal.title.should == "[제주] 김포出,아시아나+풍림리조트+렌터카3일"
    deal.price.should == 116000
    deal.url.should == "http://www.ticketmonster.co.kr/deal/47853325/101737/101765"
    deal.description.should == "[유류+택스]32,200원별도 / 01.09~02.16"
  end
end