module Unchained
  class Client
    module Servers
      attr_reader :access_level
      attr_reader :channel_id
      attr_reader :host
      attr_reader :name
      attr_reader :player_maximum
      attr_reader :shard_id

      def servers(opts={})
        get("#{base_url}/servers", opts)
      end

    end
  end
end
