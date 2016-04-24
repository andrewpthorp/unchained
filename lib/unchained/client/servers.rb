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

      def servers(opts={}, channel: nil)
        url = "#{base_url}/servers"

        if channel.nil?
          key = :channels
        else
          key = :"channels_#{channel}"
          url += "/#{channel}"
        end

        @cache[key] ||= get_resources(url, Server, opts)
      end

    end
  end
end
