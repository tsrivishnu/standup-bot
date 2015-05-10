require File.expand_path('../lib/standup_bot/version', __FILE__)

Gem::Specification.new do |s|
  s.authors       = ['Sri Vishnu Totakrua']
  s.email         = ['t.srivishnu@gmail.com']
  s.description   = 'Sends standup messages to HipChat team room '\
                      'with the time logging infofound in the toggle app'
  s.summary       = 'Send automated standup messages to HipChat team room'
  s.homepage      = 'https://github.com/tsrivishnu/standup-bot'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($\)
  s.executables   = ['standup_bot']
  # s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  # s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.name          = 'standup-bot'
  s.require_paths = ['lib']
  s.version       = StandupBot::VERSION

  s.add_dependency 'awesome_print'
  s.add_dependency 'hipchat'
  s.add_dependency 'faraday'
  s.add_dependency 'json'
  s.add_dependency 'active_support'
end
