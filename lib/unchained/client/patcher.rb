module Unchained
  class Client
    module Patcher

      class HeroContent
        include Unchained::Client::Resource
        resource({
          :id => 'id',
          :content => 'content',
          :priority => 'priority',
          :start => 'utcDateStart',
          :end => 'utcDateEnd',
        })
      end

      class Alert
        include Unchained::Client::Resource
        resource({
          :id => 'id',
          :message => 'message',
          :start => 'utcDateStart',
          :end => 'utcDateEnd',
        })
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
