require 'rspec/core/rake_task'

$:.unshift(File.dirname(__FILE__))

def run(cmd, msg)
  `#{cmd}`
  if $?.exitstatus != 0
    puts msg
    exit 1
  end
end

def outstanding_changes?
  run "git diff-files --quiet", "You have outstanding changes. Please commit them first."
end

task :default => [:spec]

task :run => "Gemfile.lock" do
  puts 'ruby main.rb'
end

desc "bundle ruby gems"
task :bundle => "Gemfile.lock"

# need to touch Gemfile.lock as bundle doesn't touch the file if there is no change
file "Gemfile.lock" => "Gemfile" do
  sh "bundle && touch Gemfile.lock"
end

task :spec do
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = '*_spec.rb'
    t.fail_on_error = false
  end
end