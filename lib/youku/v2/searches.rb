module Youku
  module V2
    class Searches < Base

      # Public: Get video API.
      #
      # Returns the instance of Youku::V2::Searches::Video.
      def video
        Video.new(client)
      end

      class Video < Base
        BASE_URI = "#{BASE_URI}/searches/video"

        # Public: Get videos by tag.
        #
        # See: http://open.youku.com/docs?id=80
        #
        # tag       - The comma separated String of tags.
        # category  - The String category.
        # period    - The String period.
        # orderby   - The String order of videos.
        # userid    - The String or Integer of a youku user ID.
        # page      - The Integer page number.
        # count     - The Integer page size.
        #
        # Returns the instance of Youku::V2::Request.
        def by_tag(tag: nil, category: nil, userid: nil, period: 'today', orderby: 'relevance', page: 1, count: 20)
          Youku::V2::Request.new "#{BASE_URI}/by_tag.json", {
            client_id: client.client_id,
            tag:       tag,
            category:  category,
            period:    period,
            orderby:   orderby,
            userid:    userid,
            page:      page,
            count:     count,
          }
        end

        # Public: Get videos by keyword.
        #
        # See: http://open.youku.com/docs?id=81
        #
        # keyword   - The space separated String of keywords.
        # period    - The String period.
        # orderby   - The String order of videos.
        # page      - The Integer page number.
        # count     - The Integer page size.
        #
        # Returns the instance of Youku::V2::Request.
        def by_keyword(keyword, period: 'week', orderby: 'published', page: 1, count: 20)
          Youku::V2::Request.new "#{BASE_URI}/by_keyword.json", {
            client_id: client.client_id,
            keyword:   keyword,
            period:    period,
            orderby:   orderby,
            page:      page,
            count:     count
          }
        end
      end
    end
  end
end
