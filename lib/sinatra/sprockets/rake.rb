require "fileutils"
require 'rake/sprocketstask'

namespace :assets do
  desc "Compile all the assets named in config.assets.precompile"
  task :precompile do
    Rake::Task['assets'].invoke
  end

  namespace :precompile do
    task :all => ["environment"] do
      Rake::Task['assets:precompile'].invoke
    end
  end

  desc "Remove compiled assets"
  task :clean do
    Rake::Task['clean_assets'].invoke
  end

  namespace :clean do
    task :all => ["environment"] do
      Rake::Task['assets:clean'].invoke
    end
  end
end
