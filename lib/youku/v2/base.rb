require 'youku/v2/request'

module Youku
  module V2
    Base = Struct.new(:client) do
      BASE_URI = "#{Youku::Client::BASE_URI}/v2"
    end
  end
end
