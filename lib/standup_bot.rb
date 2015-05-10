require 'pathname'
require 'active_support/all'

module StandupBot
  BOT_HOME = Pathname.new(File.join(File.dirname(__FILE__), '..')).realpath

  class << self

    def root
      BOT_HOME
    end

    def test
      toggl.todays_time_logs
    end

    private

    def config
      StandupBot.configuration
    end

    def toggl
      @toggl ||= StandupBot::Toggl.new()
    end
  end
end


require File.expand_path('../togglv8', __FILE__)
require File.expand_path('../standup_bot/configuration', __FILE__)

Dir[File.dirname(__FILE__) + '/standup_bot/**/**/*.rb'].sort.each{ |f|
  require f
}
