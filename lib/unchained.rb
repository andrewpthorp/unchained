require_relative 'unchained/client'
require_relative 'unchained/configuration'
require_relative 'unchained/error'

module Unchained
  extend Configuration

  # Delegate to Unchained::Client.new
  def self.new(opts={})
    Unchained::Client.new(opts)
  end
end

