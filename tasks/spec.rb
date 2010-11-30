begin
  require 'rspec/core'
  require 'rspec/core/rake_task'

  spec_prereq = :noop
  task :noop do
  end

  desc "Run all specs in spec directory (excluding plugin specs)"
  RSpec::Core::RakeTask.new(:spec => spec_prereq) do |t|
    t.rspec_opts = ["--format", "documentation"]
    t.pattern = "spec/**/*_spec.rb"
  end

rescue LoadError => e
  p e
end
