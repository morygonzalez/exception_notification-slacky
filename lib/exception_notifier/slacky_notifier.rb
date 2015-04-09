module ExceptionNotifier
  class SlackyNotifier
    attr_reader :notifier

    def initialize(options)
      begin
        webhook_url = options.fetch(:webhook_url)
        @message_opts = options.fetch(:additional_parameters, {})
        @notifier = Slack::Notifier.new webhook_url, options
      rescue
        @notifier = nil
      end
    end

    def call(exception, options={})
      env         = options[:env] || {}
      @request    = ActionDispatch::Request.new(env)
      message     = 'エラーが起こりました、至急確認してください！、！！！'
      attachments = build_attachemnt(exception, options)
      @message_opts.merge!(attachments: [attachments])
      @notifier.ping(message, @message_opts) if valid?
    end

    protected

    def valid?
      !@notifier.nil?
    end

    def build_attachemnt(exception, options = {})
      {
        fallback: "#{exception.class} #{exception.message}",
        color: "danger",
        title: "[#{Rails.env.upcase}][ERROR] #{exception.class}",
        fields: [
          {
            title: "Host",
            value: (Socket.gethostname rescue nil),
            short: true
          },
          {
            title: "Request path",
            value: @request.fullpath,
            short: true
          },
          {
            title: "HTTP Method",
            value: @request.request_method,
            short: true
          },
          {
            title: "IP Address",
            value: @request.remote_ip,
            short: true
          },
          {
            title: "Occurred on",
            value: (exception.backtrace.first rescue nil),
            short: false
          },
          {
            title: "Error message",
            value: exception.message,
            short: false
          }
        ]
      }
    end
  end
end
