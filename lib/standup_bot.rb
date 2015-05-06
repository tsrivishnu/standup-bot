require 'pathname'

module StandupBot
  BOT_HOME = Pathname.new(File.join(File.dirname(__FILE__), '..')).realpath

  class << self

    def root
      BOT_HOME
    end

    def test
      puts config.hipchat_token
    end

    private

    def config
      StandupBot.configuration
    end
  end
end


require File.expand_path('../standup_bot/configuration', __FILE__)
