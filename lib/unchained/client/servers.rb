module Unchained
  class Client
    module Servers

      class Server
        include Unchained::Client::Mixins::Resource

        attribute :access_level, Integer, json: 'accessLevel'
        attribute :channel_id, Integer, json: 'channelID'
        attribute :host, String
        attribute :name, String
        attribute :player_maximum, Integer, json: 'playerMaximum'
        attribute :shard_id, Integer, json: 'shardID'
      end

      def servers(opts={})
        get_resources("#{base_url}/servers", Server, opts)
      end

    end
  end
end
