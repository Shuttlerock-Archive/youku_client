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
    end
  end
end
