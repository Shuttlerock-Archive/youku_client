module Youku
  module V2
    class Videos < Base
      BASE_URI = "#{BASE_URI}/videos"

      # Public: Get videos for given Youku user.
      #
      # See: http://open.youku.com/docs?id=49
      #
      # user_id   - The String Youku user ID.
      # user_name - The String Youku user name.
      # orderby   - The String order of videos.
      # page      - The Integer page number.
      # count     - The Integer page size.
      #
      # Returns the instance of Youku::V2::Request.
      def by_user(user_id: nil, user_name: nil, orderby: 'published', page: 1, count: 20)
        Youku::V2::Request.new "#{BASE_URI}/by_user.json", {
          client_id: client.client_id,
          user_id:   user_id,
          user_name: user_name,
          orderby:   orderby,
          page:      page,
          count:     count
        }
      end

      # Public: Get video by ID
      #
      # See: http://open.youku.com/docs?id=46
      #
      # video_id - The String video ID.
      # ext      - The String video extension information.
      #
      # Returns the instance of Youku::V2::Request.
      def show(video_id, ext: nil)
        Youku::V2::Request.new "#{BASE_URI}/show.json", {
          client_id: client.client_id,
          video_id:  video_id,
          ext:       ext
        }
      end

      # Public: Get videos by IDs
      #
      # See: http://open.youku.com/docs?id=47
      #
      # video_ids - The comma separated String of video IDs.
      # ext       - The String video extension information.
      #
      # Returns the instance of Youku::V2::Request.
      def show_batch(video_ids: nil, ext: nil)
        Youku::V2::Request.new "#{BASE_URI}/show_batch.json", {
          client_id: client.client_id,
          video_ids: video_ids,
          ext:       ext
        }
      end

    end
  end
end
