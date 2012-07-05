require "fileutils"

namespace :assets do
  desc "Compile all the assets named in config.assets.precompile"
  task :precompile do
    Rake::Task["assets:precompile:all"].invoke
    Rake::Task["assets:clean:all"].invoke
  end

  namespace :precompile do
    task :all => ["environment"] do
      config = Sinatra::Sprockets.config
      config.compile = true
      config.digest  = true
      config.digests = {}

      env      = Sinatra::Sprockets.environment
      target   = File.join(config.app.settings.public_path, config.prefix)
      compiler = Sinatra::Sprockets::StaticCompiler.new(env, target, config.precompile, :manifest_path => config.manifest_path, :digest => config.digest, :manifest => true)
      compiler.compile
    end
  end

  desc "Remove compiled assets"
  task :clean do
    Rake::Task["assets:clean:all"].invoke
  end

  namespace :clean do
    task :all => ["environment"] do
      config = Sinatra::Sprockets.config

      releases = Dir["#{config.app.settings.public_path}/assets/*.yml"].sort.reverse
      n = 5

      filenames_to_save = []
      releases[0...n].each do |r|
        filenames_to_save |= YAML::load(File.open(r)).values
      end

      filenames_to_delete = []
      releases[0...-n].each do |r|
        filenames_to_delete |= YAML::load(File.open(r)).values
      end

      (filenames_to_delete - filenames_to_save).each do |filename|
        rm_rf filename
        rm_rf "#{filename}.gz" if filename =~ /\.(css|js)$/
      end
    end
  end
end
