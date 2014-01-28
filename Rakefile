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

task :spec do
  RSpec::Core::RakeTask.new(:spec)
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.fail_on_error = false
end