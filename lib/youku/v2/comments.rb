module Youku
  module V2
    class Comments < Base
      BASE_URI = "#{BASE_URI}/comments"

      # Public: Get comments by a video ID
      #
      # See: http://open.youku.com/docs?id=35
      #
      # video_id - The string video ID.
      # page     - The Integer page number.
      # count    - The Integer page size.
      #
      # Returns the instance of Youku::V2::Request.
      def by_video(video_id: nil, page: 1, count: 20)
        Youku::V2::Request.new "#{BASE_URI}/by_video.json", {
          client_id: client.client_id,
          video_id:  video_id,
          page:      page,
          count:     count,
        }
      end
    end
  end
end
