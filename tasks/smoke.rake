desc "Run smoke tests from examples directory"
namespace :google do
  namespace :smoke do
    desc "Smoke tests for Google Compute Engine."
    task :compute do
      puts "These smoke tests assume you have a file at ~/.fog which has your credentials for connecting to GCE."

      Dir.glob("./examples/*.rb").each do |file|
        puts "Running #{file}:"
        require file
        test
      end
    end
  end
end
