module StandupBot
  class Toggl
    def initialize()
      user
      tog
    end

    def todays_time_logs
      tog.get_time_entries()
    end

    def tog
      @tog ||= ::Toggl.new(config.toggl_token)
    end

    def user
      @user ||= tog.me(true)
    end

  private

    def config
      StandupBot.configuration
    end
  end
end
