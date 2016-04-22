module Unchained
  class Client
    module MOTD

      class Message
        include Unchained::Client::Mixins::Resource

        attribute :id, String
        attribute :message, String
        attribute :duration, Integer
      end

      def motd(opts={})
        get_resource("#{base_url}/messageoftheday", Message, opts)
      end

    end
  end
end
