# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'exception_notification/slacky/version'

Gem::Specification.new do |spec|
  spec.name          = "exception_notification-slacky"
  spec.version       = ExceptionNotification::Slacky::VERSION
  spec.authors       = ["森井ゴンザレス"]
  spec.email         = ["morygonzalez@gmail.com"]

  spec.summary       = %q{Send Exception notification to slack}
  spec.description   = %q{Send Exception notification to slack}
  spec.homepage      = "https://github.com/morygonzalez/exception_notification-slacky"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_runtime_dependency 'exception_notification', '~> 4.0'
  spec.add_runtime_dependency 'slack-notifier', '~> 1.1'

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rack'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'webmock'
end
