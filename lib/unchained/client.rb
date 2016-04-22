require_relative 'configuration'
require_relative 'request'

# RESOURCES
require_relative 'client/mixins/resource'
require_relative 'client/archetypes'
require_relative 'client/attributes'
require_relative 'client/factions'
require_relative 'client/motd'
require_relative 'client/races'
require_relative 'client/patcher'
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

    include Unchained::Request

    # RESOURCES
    include Unchained::Client::Archetypes
    include Unchained::Client::Attributes
    include Unchained::Client::Factions
    include Unchained::Client::MOTD
    include Unchained::Client::Races
    include Unchained::Client::Patcher
    include Unchained::Client::Servers
  end
end
