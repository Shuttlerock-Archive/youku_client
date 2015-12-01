module Youku
  module V2
    class Videos < Base
      BASE_URI = "#{BASE_URI}/videos"

      # Public: Get basic information by video ID
      #
      # See: http://open.youku.com/docs?id=44
      #
      # video_id  - The video ID.
      # video_url - The video's URL.
      #
      # Returns the instance of Youku::V2::Request.
      def show_basic(video_id: nil, video_url: nil)
        Youku::V2::Request.new "#{BASE_URI}/show_basic.json", {
          client_id: client.client_id,
          video_id:  video_id,
          video_url: video_url,
        }
      end

      # Public: Get basic information by video IDs
      #
      # See: http://open.youku.com/docs?id=45
      #
      # video_ids - The String video IDs.
      #
      # Returns the instance of Youku::V2::Request.
      def show_basic_batch(video_ids: nil)
        Youku::V2::Request.new "#{BASE_URI}/show_basic_batch.json", {
          client_id: client.client_id,
          video_ids: video_ids,
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
      def show(video_id: nil, ext: nil)
        Youku::V2::Request.new "#{BASE_URI}/show.json", {
          client_id: client.client_id,
          video_id:  video_id,
          ext:       ext,
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
          ext:       ext,
        }
      end

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
          count:     count,
        }
      end

      # Public: Get videos that relate to another video.
      #
      # See: http://open.youku.com/docs?id=52
      #
      # video_id - The String video ID.
      # count    - The Integer page size.
      #
      # Returns the instance of Youku::V2::Request.
      def by_related(video_id: nil, count: 20)
        Youku::V2::Request.new "#{BASE_URI}/by_related.json", {
          client_id: client.client_id,
          video_id:  video_id,
          count:     count,
        }
      end

      # Public: Get videos for a given category.
      #
      # See: http://open.youku.com/docs?id=57
      #
      # category - The String category.
      # genre    - The String genre.
      # period   - The String period.
      # orderby  - The String order of videos.
      # page     - The Integer page number.
      # count    - The Integer page size.
      #
      # Returns the instance of Youku::V2::Request.
      def by_category(category: nil, genre: nil, period: nil, orderby: 'view-count', page: 1, count: 20)
        Youku::V2::Request.new "#{BASE_URI}/by_category.json", {
          client_id: client.client_id,
          category:  category,
          genre:     genre,
          period:    period,
          orderby:   orderby,
          page:      page,
          count:     count,
        }
      end

      # Public: Get favourite API.
      #
      # Returns the instance of Youku::V2::Videos::Favorite.
      def favorite
        Favorite.new(client)
      end

      class Favorite < Base
        BASE_URI = "#{BASE_URI}/favorite"

        # Public: Get a given user's favorite videos
        #
        # See: http://open.youku.com/docs?id=54
        #
        # user_id   - The String Youku user ID.
        # user_name - The String Youku user name.
        # orderby   - The String order of videos.
        # page      - The Integer page number.
        # count     - The Integer page size.
        #
        # Returns the instance of Youku::V2::Request.
        def by_user(user_id: nil, user_name: nil, orderby: 'favorite-time', page: 1, count: 20)
          Youku::V2::Request.new "#{BASE_URI}/by_user.json", {
            client_id: client.client_id,
            user_id:   user_id,
            user_name: user_name,
            orderby:   orderby,
            page:      page,
            count:     count,
          }
        end
      end
    end
  end
end
