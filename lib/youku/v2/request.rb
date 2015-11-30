require 'hashie'
require 'typhoeus'
require 'multi_json'

module Youku
  module V2
    class Request
      attr_reader :url, :params, :response

      # Public: Constructor.
      #
      # url    - The String url.
      # params - The Hash query params.
      def initialize(url, params)
        @url      = url
        @params   = params
        @response = Typhoeus::Request.new(url, params: params, connecttimeout: 5, timeout: 10).run
      end

      # Public: Get next page.
      #
      # Returns the instance of Youku::V2::Request.
      def next_page
        Request.new url, params.merge(page: params[:page] + 1)
      end

      # Returns true at successful request , false otherwise.
      def ok?
        response.code == 200
      end

      # Public: Get response code.
      #
      # Returns Integer code of response.
      def code
        response.code
      end

      # Public: Get return code.
      #
      # Returns Integer return code.
      def return_code
        response.return_code
      end

      # Public: Get body.
      #
      # Returns the instance of Hashie::Mash.
      def body
        @body ||= Hashie::Mash.new(MultiJson.load response.body || '')
      end

    end
  end
end
