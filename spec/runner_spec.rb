require 'spec_helper'
require 'rack/test'
require './lib/runner'
require 'rss'

describe '/' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "should return rss of Tmon" do
    response = get('/')

    rss = RSS::Parser.parse(response.body)
    rss.channel.title.should == "티켓몬스터 제주도 여행 RSS"
  end
end