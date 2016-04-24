$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'unchained'
require 'minitest/autorun'
require 'minitest/reporters'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "test/_fixtures/vcr_cassettes"
  config.hook_into :webmock
end


Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new

