require "factory_girl"
require 'database_cleaner'
require 'omniauth'

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect

    mocks.verify_partial_doubles = true
  end

  config.include FactoryGirl::Syntax::Methods

  OmniAuth.config.test_mode = true

  omniauth_hash = { 'provider' => 'twitter',
                    'uid' => '12345',
                    'info' => { 'name' => 'natasha' }
                  }
  # OmniAuth.config.add_mock(:twitter, omniauth_hash)

  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(omniauth_hash)
end
