require 'spec_helper'

describe ExceptionNotification::Slacky do
  before do
    allow(exception).to receive(:backtrace).and_return(['backtrace line 1', 'backtrace line 2'])
    allow(exception).to receive(:message).and_return('exception message')
  end

  let(:exception) do
    begin
      5/0
    rescue Exception => e
      e
    end
  end

  let(:fake_notification) do
    [
      'Exception Occured!',
      {
        icon_emoji: ':warning:',
        attachments: [
          fallback: "#{exception.class} #{exception.message}",
          color: 'danger',
          title: "[ERROR] #{exception.class}",
          fields: [
            { title: 'Host',          value: Socket.gethostname,        short: true  },
            { title: 'Request path',  value: '/foo/bar',                short: true  },
            { title: 'HTTP Method',   value: 'POST',                    short: true  },
            { title: 'IP Address',    value: '127.0.0.1',               short: true  },
            { title: 'Occurred on',   value: exception.backtrace.first, short: false },
            { title: 'Error message', value: exception.message,         short: false }
          ]
        ]
      }
    ]
  end

  describe 'Notification should be sent' do
    let(:slack_notifier) do
      ExceptionNotifier::SlackyNotifier.new(options)
    end

    let(:options) do
      {
        webhook_url: 'http://slack.webhook.url',
        username: 'slacky',
        channel: '#general',
        additional_parameters: {
          icon_emoji: ':warning:'
        }
      }
    end

    let(:rack_options) do
      { env: { 'PATH_INFO' => '/foo/bar', 'REQUEST_METHOD' => 'POST', 'REMOTE_ADDR' => '127.0.0.1' } }
    end

    describe 'Notification format' do
      it {
        allow_any_instance_of(Slack::Notifier).to receive(:ping).with(*fake_notification)
        slack_notifier.call(exception, rack_options)
      }
    end

    describe 'Options' do
      before do
        stub_request(:any, options[:webhook_url])
        slack_notifier.call(exception, rack_options)
      end

      it { expect(slack_notifier.notifier.channel).to eq('#general') }
      it { expect(slack_notifier.notifier.username).to eq('slacky') }
      it { expect(slack_notifier.notifier.default_payload[:additional_parameters][:icon_emoji]).to eq(':warning:') }
    end
  end
end
