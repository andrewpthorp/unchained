module Unchained
  class Client
    module Servers

      class Server
        include Unchained::Client::Resource
        resource({
          :access_level => 'accessLevel',
          :channel_id => 'channelID',
          :host => 'host',
          :name => 'name',
          :player_maximum => 'playerMaximum',
          :shard_id => 'shardID',
        })
      end

      def servers(opts={})
        get("#{base_url}/servers", opts).map do |server|
          Server.decode_result(server)
        end
      end

    end
  end
end
