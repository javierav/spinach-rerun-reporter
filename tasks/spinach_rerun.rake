# This file is based on https://gitlab.com/gitlab-org/gitlab-ce/blob/master/lib/tasks/spinach.rake
# Authored by Kamil Trzcinski <ayufan@ayufan.eu>
require 'colorize'

namespace :spinach do
  desc 'run spinach tests with rerun reporter'
  task :rerun do
    run_spinach_tests
  end
end

def tags
  ENV['SPINACH_RERUN_TAGS']
end

def rerun_file
  ENV['SPINACH_RERUN_FILE'] || 'tmp/spinach-rerun.txt'
end

def retry_count
  ENV['SPINACH_RERUN_RETRY_COUNT'] ? ENV['SPINACH_RERUN_RETRY_COUNT'].to_i : 3
end

def prepend_cmd
  ENV['SPINACH_RERUN_PREPEND_CMD'] || nil
end

def run_command(cmd)
  env = { 'RAILS_ENV' => 'test', 'SPINACH_RERUN_FILE' => rerun_file }
  system(env, *cmd.compact)
end

def run_spinach(args)
  run_command([prepend_cmd] + %w(spinach -r rerun) + args)
end

# rubocop:disable Metrics/AbcSize
def run_spinach_tests
  success = run_spinach(%W(--tags #{tags}))

  retry_count.times do
    break if success
    break unless File.exist?(rerun_file)

    tests = File.foreach(rerun_file).map(&:chomp)
    puts ''
    puts "Spinach tests for #{tags}: Retrying tests... #{tests}".red
    puts ''
    sleep(3)
    success = run_spinach(tests)
  end

  raise("spinach tests for #{tags} failed!".red) unless success
end
