module StandupBot

  class << self
    def configuration
      @configuration ||=  Configuration.new
    end

    def configure
      yield(configuration) if block_given?
    end
  end

  class Configuration
    # Structure from https://github.com/experteer/codeqa/blob/master/lib/codeqa/configuration.rb
    attr_accessor :hipchat_token, :toggl_token

    def initialize
      self.hipchat_token = nil
      self.toggl_token   = nil
    end

    def default_config_path
      StandupBot.root.join('config', 'default')
    end

    def home_config_path
      home_dir_config = File.join(home_dir, DOTFILE)
      return home_dir_config if File.exist? home_dir_config
      false
    end

    def project_config_path
      return nil if project_root.nil?
      project_root_config = File.join(project_root, DOTFILE)
      return project_root_config if File.exist? project_root_config
      false
    end

  private

    DOTFILE = '.standup_bot.rb'

    def home_dir
      @home_dir ||= Dir.home
    end

    def project_root
      @project_root ||= git_root_till_home
    end

    # ascend from the current dir till I find a .git folder or reach home_dir
    def git_root_till_home
      Pathname.new(Dir.pwd).ascend do |dir_pathname|
        return dir_pathname if File.directory?("#{dir_pathname}/.git")
        return nil if dir_pathname.to_s == home_dir
      end
    end
  end
end

require StandupBot.configuration.default_config_path
require StandupBot.configuration.home_config_path if StandupBot.configuration.home_config_path
require StandupBot.configuration.project_config_path if StandupBot.configuration.project_config_path

