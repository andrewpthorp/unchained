require_relative 'configuration'
require_relative 'client/request'
require_relative 'client/servers'

module Unchained
  class Client
    attr_accessor(*Unchained::Configuration::KEYS)

    def initialize(opts={})
      config = Unchained.configuration.merge(opts)
      Unchained::Configuration::KEYS.each do |key|
        send("#{key}=", config[key])
      end
    end

    def base_url
      'http://api.camelotunchained.com/v1'
    end

    include Unchained::Client::Request
    include Unchained::Client::Servers
  end
end
