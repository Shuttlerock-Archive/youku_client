require 'youku/client'

module Youku

  autoload :VERSION, File.join(File.dirname(__FILE__), 'youku/version')

  class << self
    # Public: Constructor.
    #
    # client_id     - The String Youku client ID.
    # client_secret - The String Youku secret key.
    #
    # Returns the instance of Youku::Client.
    def new(client_id: nil, client_secret: nil)
      Youku::Client.new(client_id: client_id, client_secret: client_secret)
    end
  end

end
