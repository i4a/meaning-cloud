require 'json'
require 'rest_client'
require 'meaning_cloud/topics'

# Top level name space for the entire Gem.
module MeaningCloud
  API_BASE = 'https://api.meaningcloud.com/topics-1.2.php'

  def self.configuration
    @configuration ||=  Configuration.new
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
  end

  # Main configuration class.
  class Configuration
    attr_accessor :key

    def initialize
      @key = nil
    end
  end
end