
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mdpdf/version"

Gem::Specification.new do |spec|
  spec.name          = "mdpdf"
  spec.version       = Mdpdf::VERSION
  spec.authors       = ["723"]
  spec.email         = ["rb.natsumi@gmail.com"]

  spec.summary       = %q{MorkDown file to PDF convert}
  spec.description   = %q{Written in MarkDown file,it convert to PDF}
  spec.homepage      = "https://github.com/723gt/mdpdf"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
