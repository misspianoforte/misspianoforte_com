require 'tmpdir'

# Change your GitHub reponame
GITHUB_REPONAME = "friesencr/teamfriesen_com"

namespace :site do
  desc "Generate blog files"
  task :generate do
    puts `bundle exec middleman build`
  end


  desc "Generate and publish blog to gh-pages"
  task :publish => [:generate] do
    Dir.mktmpdir do |tmp|
      cp_r "build/.", tmp
      Dir.chdir tmp
      system "git init"
      system "git add ."
      message = "Site updated at #{Time.now.utc}"
      system "git commit -m #{message.shellescape}"
      system "git remote add origin git@github.com:#{GITHUB_REPONAME}.git"
      system "git push origin master:refs/heads/gh-pages --force"
    end
  end
end
