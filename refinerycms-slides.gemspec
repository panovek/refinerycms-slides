# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-slides'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Slides extension for Refinery CMS'
  s.author            = 'Tortus'
  s.date              = '2014-05-19'
  s.summary           = 'Slides extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core', '~> 3.0.0'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 3.0.0'
end
