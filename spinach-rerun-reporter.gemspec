require 'date'

Gem::Specification.new do |s|
  #
  ## INFORMATION
  #
  s.name = 'spinach-rerun-reporter'
  s.version = '0.0.2'
  s.summary = 'spinach rerun reporter'
  s.description = nil
  s.author = %w(Javier Aranda)
  s.email = %w(javier@aranda.io)
  s.license = 'MIT'
  s.date = Date.today.strftime('%Y-%m-%d')
  s.homepage = 'https://github.com/arandaio/spinach-rerun-reporter'

  #
  ## GEM
  #
  s.require_paths = %w(lib)
  s.files = s.files = Dir.glob('lib/**/*') + %w(LICENSE README.md)
  s.extra_rdoc_files = %w(README.md LICENSE)
  s.required_ruby_version = '~> 2.0'

  #
  ## DEPENDENCIES
  #
  s.add_dependency 'spinach', '~> 0.8'
end
