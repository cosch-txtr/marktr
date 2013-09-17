RAILS_HOME = File.expand_path(File.join(File.dirname(__FILE__),"../.."))

namespace :marktr do

task :crons_add do
  puts "adding to crons now:"
  exec "whenever --update-crontab #{RAILS_HOME}/config/schedule.rb"
end

task :crons_rm do
  puts "removing from crons now:"
  exec "whenever --clear-crontab #{RAILS_HOME}/config/schedule.rb"
end

task :crons_status do
  puts "crons status:"
  exec "crontab -l"
end

end
