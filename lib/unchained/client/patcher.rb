module Unchained
  class Client
    module Patcher

      class HeroContent
        include Unchained::Client::Mixins::Resource

        attribute :id, String
        attribute :content, String
        attribute :priority, Integer
        attribute :start, String, json: 'utcDateStart'
        attribute :end, String, json: 'utcDateEnd'
      end

      class Alert
        include Unchained::Client::Mixins::Resource

        attribute :id, Integer
        attribute :message, String
        attribute :start, String, json: 'utcDateStart'
        attribute :end, String, json: 'utcDateEnd'
      end

      def patcher_hero_contents(opts={})
        get_resources("#{base_url}/patcherherocontent", HeroContent, opts)
      end

      def patcher_alerts(opts={})
        get_resources("#{base_url}/patcheralerts", Alert, opts)
      end

    end
  end
end
