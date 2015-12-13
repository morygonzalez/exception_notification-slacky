# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'exception_notification/slacky/version'

Gem::Specification.new do |spec|
  spec.name          = "exception_notification-slacky"
  spec.version       = ExceptionNotification::Slacky::VERSION
  spec.licenses      = ['MIT']
  spec.authors       = ["森井ゴンザレス", "Ryutaro Mizokami"]
  spec.email         = ["morygonzalez@gmail.com", "r.mizokami@gmail.com"]

  spec.summary       = %q{Send Exception notification to slack}
  spec.description   = %q{Send Exception notification to slack. Works as ExceptionNotification Plugin.}
  spec.homepage      = "https://github.com/morygonzalez/exception_notification-slacky"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'exception_notification', '~> 4.0'
  spec.add_runtime_dependency 'slack-notifier', '~> 1.1'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rack', '~> 1.6'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 1.21'
end
