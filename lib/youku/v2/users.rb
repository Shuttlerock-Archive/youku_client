module Youku
  module V2
    class Users < Base
      BASE_URI = "#{BASE_URI}/users"

      # Public: Get users by IDs
      #
      # See: http://open.youku.com/docs?id=25
      #
      # user_ids   - The comma separated String of user IDs.
      # user_names - The comma separated String of user names.
      #
      # Returns the instance of Youku::V2::Request.
      def show_batch(user_ids: nil, user_names: nil)
        Youku::V2::Request.new "#{BASE_URI}/show_batch.json", {
          client_id:  client.client_id,
          user_ids:   user_ids,
          user_names: user_names,
        }
      end

      # Public: Get user by ID
      #
      # See: http://open.youku.com/docs?id=24
      #
      # user_id   - The string of a youku user ID
      # user_name - The string of a youku user name.
      #
      # Returns the instance of Youku::V2::Request.
      def show(user_id: nil, user_name: nil)
        Youku::V2::Request.new "#{BASE_URI}/show.json", {
          client_id: client.client_id,
          user_id:   user_id,
          user_name: user_name,
        }
      end

      # Public: Get favourite API.
      #
      # Returns the instance of Youku::V2::Users::Friendship.
      def friendship
        Friendship.new(client)
      end

      class Friendship < Base
        BASE_URI = "#{BASE_URI}/friendship"

        # Public: Get the users following a given user.
        #
        # See: http://open.youku.com/docs?id=26
        #
        # user_id   - The String Youku user ID.
        # user_name - The String Youku user name.
        # page      - The Integer page number.
        # count     - The Integer page size.
        #
        # Returns the instance of Youku::V2::Request.
        def followings(user_id: nil, user_name: nil, page: 1, count: 20)
          Youku::V2::Request.new "#{BASE_URI}/followings.json", {
            client_id: client.client_id,
            user_id:   user_id,
            user_name: user_name,
            page:      page,
            count:     count,
          }
        end

        # Public: Get the users a given user is following.
        #
        # See: http://open.youku.com/docs?id=27
        #
        # user_id   - The String Youku user ID.
        # user_name - The String Youku user name.
        # page      - The Integer page number.
        # count     - The Integer page size.
        #
        # Returns the instance of Youku::V2::Request.
        def followers(user_id: nil, user_name: nil, page: 1, count: 20)
          Youku::V2::Request.new "#{BASE_URI}/followers.json", {
            client_id: client.client_id,
            user_id:   user_id,
            user_name: user_name,
            page:      page,
            count:     count,
          }
        end
      end
    end
  end
end
