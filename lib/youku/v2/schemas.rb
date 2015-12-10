module Youku
  module V2
    class Schemas < Base
      BASE_URI = "#{BASE_URI}/schemas"

      # Public: Get video API.
      #
      # Returns the instance of Youku::V2::Schemas::Video.
      def video
        Video.new(client)
      end

      class Video < Base
        BASE_URI = "#{BASE_URI}/video"

        # Public: Get video categories.
        #
        # See: http://open.youku.com/docs?id=90
        #
        # Returns the instance of Youku::V2::Request.
        def category()
          Youku::V2::Request.new "#{BASE_URI}/category.json"
        end
      end
    end
  end
end
