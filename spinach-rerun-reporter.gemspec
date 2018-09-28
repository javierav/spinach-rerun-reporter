require 'date'
require_relative 'lib/spinach-rerun-reporter/version'

Gem::Specification.new do |s|
  #
  ## INFORMATION
  #
  s.name = 'spinach-rerun-reporter'
  s.version = SpinachRerunReporter.version
  s.summary = 'spinach rerun reporter'
  s.description = nil
  s.author = %w[Javier Aranda]
  s.email = %w[javier.aranda.varo@gmail.com]
  s.license = 'MIT'
  s.date = Date.today.strftime('%Y-%m-%d')
  s.homepage = 'https://github.com/javierav/spinach-rerun-reporter'

  #
  ## GEM
  #
  s.require_paths = %w[lib]
  s.files = `git ls-files -z -- lib/* LICENSE README.md spinach-rerun-reporter.gemspec`.split("\x0")
  s.extra_rdoc_files = %w[README.md LICENSE]
  s.required_ruby_version = '> 2.0'

  #
  ## DEPENDENCIES
  #
  s.add_dependency 'spinach', '> 0.10'
end
