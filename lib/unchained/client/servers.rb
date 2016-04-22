module Unchained
  class Client
    module Servers

      class Server
        include Unchained::Client::Mixins::Resource
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
        get_resources("#{base_url}/servers", Server, opts)
      end

    end
  end
end
