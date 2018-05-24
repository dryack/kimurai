require_relative 'kimurai/version'

require 'pathname'
require 'ostruct'

module Kimurai
  class << self
    def configuration
      @configuration ||= OpenStruct.new
    end

    def configure
      yield(configuration)
    end

    def env
      ENV.fetch("KIMURAI_ENV", "development")
    end

    def root
      Pathname.new('..').expand_path(File.dirname(__FILE__))
    end

    # current crawler
    def current_crawler
      ENV["CURRENT_CRAWLER"]
    end

    def current_crawler=(value)
      ENV.store("CURRENT_CRAWLER", value)
    end

    # timezone
    def timezone
      ENV["TZ"]
    end

    def timezone=(value)
      ENV.store("TZ", value)
    end
  end
end

