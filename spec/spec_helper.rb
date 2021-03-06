# frozen_string_literal: true

require 'simplecov'
require 'simplecov-lcov'

SimpleCov::Formatter::LcovFormatter.config do |c|
  c.report_with_single_file = true
  c.output_directory = 'coverage'
  c.lcov_file_name = 'lcov.info'
  c.single_report_path = 'coverage/lcov.info'
end
SimpleCov.formatter = SimpleCov::Formatter::LcovFormatter
SimpleCov.start do
  add_filter 'app/secrets'
end

require 'tempfile'

def fixture_path(filename)
  File.join(File.dirname(__FILE__), 'fixtures', filename)
end

def tmp_config_path(obj)
  file = Tempfile.new('frise_config')
  file.write(YAML.dump(obj))
  file.close
  file.path
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
