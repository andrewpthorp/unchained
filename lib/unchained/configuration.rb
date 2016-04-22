module Unchained
  module Configuration

    KEYS = [:login_token]
    attr_accessor(*KEYS)

    def self.extended(base)
      base.reset!
    end

    def configure
      yield self
    end

    def configuration
      KEYS.inject({}){|o,k| o.merge!(k => send(k)) }
    end

    def reset!
      self.login_token = nil
    end

  end
end
