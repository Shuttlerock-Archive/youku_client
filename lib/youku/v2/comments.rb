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

      # Public: Get a comment by ID.
      #
      # See: http://open.youku.com/docs?id=32
      #
      # comment_id - The string comment ID.
      #
      # Returns the instance of Youku::V2::Request.
      def show(comment_id: nil)
        Youku::V2::Request.new "#{BASE_URI}/show.json", {
          client_id:  client.client_id,
          comment_id: comment_id,
        }
      end

      # Public: Get comments by their IDs.
      #
      # See: http://open.youku.com/docs?id=34
      #
      # comment_ids - The string comment IDs.
      #
      # Returns the instance of Youku::V2::Request.
      def show_batch(comment_ids: nil)
        Youku::V2::Request.new "#{BASE_URI}/show_batch.json", {
          client_id:  client.client_id,
          comment_ids: comment_ids,
        }
      end

      # Public: Get hot API.
      #
      # Returns the instance of Youku::V2::Comments::Hot.
      def hot
        Hot.new(client)
      end

      class Hot < Base
        BASE_URI = "#{BASE_URI}/hot"

        # Public: Get hot comments given a video.
        #
        # See: http://open.youku.com/docs?id=36
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
            count:     count
          }
        end
      end
    end
  end
end
