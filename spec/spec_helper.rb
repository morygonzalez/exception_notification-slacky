$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'exception_notification/slacky'
require 'webmock/rspec'

RSpec.configure do |config|
  config.before do
    WebMock.disable_net_connect!
  end
end
