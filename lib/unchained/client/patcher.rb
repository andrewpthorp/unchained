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

        attribute :id, String
        attribute :message, String
        attribute :start, String, json: 'utcDateStart'
        attribute :end, String, json: 'utcDateEnd'
      end

      def patcher_hero_contents(opts={})
        @cache[:patcher_hero_contents] ||= get_resources(
          "#{base_url}/patcherherocontent",
          HeroContent,
          opts,
        )
      end

      def patcher_alerts(opts={})
        @cache[:patcher_alerts] ||= get_resources(
          "#{base_url}/patcheralerts",
          Alert,
          opts,
        )
      end

    end
  end
end
