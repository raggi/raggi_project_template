#!/usr/bin/env rake
require 'rubygems'  unless defined?(Gem)
require 'rake'      unless defined?(Rake)

Package = false # Build zips and tarballs?

GSpec = Gem::Specification.new do |s|
  s.name = 'raggi_project_template'
  s.summary = 'A template for other ruby projects. Based on git, bacon, facon, rake and rubygems.'
  s.description = s.summary
  s.author = 'James Tucker'
  s.email = 'raggi@rubyforge.org'
  s.homepage = 'http://github.com/raggi/raggi_project_template'
  s.rubyforge_project = nil

  s.version = Time.now.strftime("%Y.%m.%d")
  s.version += ENV['VERSION_APPEND'] if ENV['VERSION_APPEND']

  s.files = %w(Rakefile) + Dir.glob("{bin,docs,lib,spec,test,scripts,tasks}/**/*")

  if s.has_rdoc = true
    main_rdoc = "README" if test ?e, "README"
    main_rdoc ||= "docs/README" if test ?e, "docs/README"
    s.extra_rdoc_files = Dir.glob("docs/*")
    s.rdoc_options.concat %W(
      --title #{s.name}
      --main #{main_rdoc}
      --tab-width 2
      --line-numbers
      --inline-source
      --charset utf-8
    )
  end

  s.bindir = 'bin' if File.directory?('bin')
  s.require_path = 'lib'

  s.platform = Gem::Platform::RUBY
  if runner = Dir['{spec,test}/runner'].first
    s.test_file = runner
  end
end

Dir.glob('tasks/**/*.rake').each { |r| Rake.application.add_import r }

task :default => :test