# frozen_string_literal: true

require 'bundler/setup'
require 'vcr'
require 'roadmapster'
require 'pry'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  VCR.configure do |c|
    c.hook_into :webmock
    c.cassette_library_dir = 'spec/vcr/cassettes'
    c.default_cassette_options = { record: :new_episodes }
    c.configure_rspec_metadata!
    c.filter_sensitive_data('<AUTH_TOKEN>') do
      ENV['WIZELINE_API_TOKEN']
    end
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
