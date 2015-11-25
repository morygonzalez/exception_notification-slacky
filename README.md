# ExceptionNotification::Slacky

[![wercker status](https://app.wercker.com/status/f4a6b632836b07c473e73edeeaa54808/m "wercker status")](https://app.wercker.com/project/bykey/f4a6b632836b07c473e73edeeaa54808)

Rich informed exception_notifier for slack.

![2015-04-09 21 26 41](https://cloud.githubusercontent.com/assets/106567/7066600/36176e0c-deff-11e4-9bac-72b4e5ba15c7.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'exception_notification-slacky'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install exception_notification-slacky

## Usage

Work as custom notifier for exception_notification.

### Example usage with Rails

add below lines to config/initializers/exception_notification.rb.

```ruby
  config.add_notifier :slacky, {
    webhook_url: 'your slack incoming webhook url',
    channel: 'channel you want to being notified to',
    username: 'slacky',
    color: :danger, # optional, default to :danger
    addtional_parameters: {
      icon_emoji: ':warning:'
    }
  }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/morygonzalez/exception_notification-slacky/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
