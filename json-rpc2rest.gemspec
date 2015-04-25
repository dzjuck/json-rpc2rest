Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.name              = "json-rpc2rest"
  s.version           = "0.1.2"
  s.date              = "2015-03-28"

  s.summary           = "Json-Rpc to Rest middleware."
  s.description       = "Json-Rpc to Rest middleware."
  s.authors           = ["Ilya Lavrov"]
  s.email             = "dzjuck@gmail.com"
  s.homepage          = "http://github.com/dzjuck/json-rpc2rest"
  s.files             = ["lib/json-rpc2rest.rb"]
  s.test_files        = ["spec/json-rpc2rest_spec.rb"]

  s.require_paths     = %w[lib]
  s.rubygems_version  = '1.1.1'
  s.license           = 'MIT'
end