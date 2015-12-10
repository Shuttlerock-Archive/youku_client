module Youku
  class Client
    BASE_URI = 'https://openapi.youku.com'

    attr_reader :client_id, :client_secret

    # Public: Constructor.
    #
    # client_id     - The String Youku client ID.
    # client_secret - The String Youku secret key.
    def initialize(client_id: nil, client_secret: nil)
      @client_id     = client_id
      @client_secret = client_secret
    end

    # Public: Get searches API.
    #
    # Returns the instance of Youku::V2::Searches.
    def searches
      Youku::V2::Searches.new(self)
    end

    # Public: Get videos API.
    #
    # Returns the instance of Youku::V2::Videos.
    def videos
      Youku::V2::Videos.new(self)
    end

    # Public: Get users API.
    #
    # Returns the instance of Youku::V2::Users.
    def users
      Youku::V2::Users.new(self)
    end

    # Public: Get users API.
    #
    # Returns the instance of Youku::V2::Users.
    def comments
      Youku::V2::Comments.new(self)
    end

    # Public: Get users API.
    #
    # Returns the instance of Youku::V2::Users.
    def schemas
      Youku::V2::Schemas.new(self)
    end
  end
end

require 'youku/v2/base'
require 'youku/v2/searches'
require 'youku/v2/users'
require 'youku/v2/videos'
require 'youku/v2/comments'
require 'youku/v2/schemas'
