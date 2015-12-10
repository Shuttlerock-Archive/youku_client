module Youku
  module V2
    class Schemas < Base
      BASE_URI = "#{BASE_URI}/schemas"

      # Public: Get hot API.
      #
      # Returns the instance of Youku::V2::Comments::Video.
      def video
        Video.new(client)
      end

      class Video < Base
        BASE_URI = "#{BASE_URI}/video"

        # Public: Get hot comments given a video.
        #
        # See: http://open.youku.com/docs?id=36
        #
        # video_id - The string video ID.
        # page     - The Integer page number.
        # count    - The Integer page size.
        #
        # Returns the instance of Youku::V2::Request.
        def category()
          Youku::V2::Request.new "#{BASE_URI}/category.json"
        end
      end
    end
  end
end
