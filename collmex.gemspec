Gem::Specification.new do |s|
  s.name        = 'collmex'
  s.version     = '0.4.0'
  s.date        = '2012-07-29'
  s.summary     = "A ruby api lib for collmex"
  s.description = "A lib written in ruby that talks to the german accounting software collmex."
  s.authors     = ["Danyel Bayraktar", "Roman Lehnert"]
  s.email       = 'cydrop@gmail.com'
  s.files       = Dir['lib/**/*.rb']
  s.homepage    = 'https://github.com/romanlehnert/collmex-ruby'
  s.license     = "MIT"
  s.add_development_dependency 'json', '~> 1.8.0'
  s.add_development_dependency 'rspec', '~> 2.5'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'vcr'
  s.test_files  = Dir.glob("{spec,test}/**/*.rb")
end
