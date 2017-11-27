# frozen_string_literal: true

require 'date'
require 'rake/clean'

CLOBBER << '_site'

desc 'Install dependencies'
task :init do
  sh 'bundle', 'install', '--path', 'vendor'
end

desc 'Build the site'
task build: ['build:jekyll']

namespace :build do
  desc 'Generate static page with Jekyll'
  task :jekyll do
    sh 'jekyll', 'build'
  end
end

namespace :images do
  PNGS = FileList['assets/images/*.png']

  namespace :optimise do
    task :png do
      sh 'optipng', *PNGS
    end
  end

  desc 'Optimise all images in-place'
  task optimise: ['optimise:png']
end

namespace :run do
  desc 'Preview the site, live-reloading and rebuilding automatically'
  task :preview do
    sh 'jekyll', 'serve', '--livereload', '--future', '--drafts'
  end
end
