# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wikipedia_html_sanitize/version'

Gem::Specification.new do |spec|
  spec.name          = "wikipedia_html_sanitize"
  spec.version       = WikipediaHtmlSanitize::VERSION
  spec.authors       = ["Shu Uesugi"]
  spec.email         = ["shu@chibicode.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = ""

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('aruba')
  spec.add_development_dependency('rspec')
  spec.add_dependency('methadone', '~> 1.7.0')
  spec.add_dependency('faraday')
  spec.add_dependency('sanitize')
end
