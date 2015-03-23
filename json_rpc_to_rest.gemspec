Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.name              = "json_rpc_to_rest"
  s.version           = "0.1.0"
  s.date              = "2015-03-23"

  s.summary           = "Json-Rpc to Rest middleware."
  s.description       = "Json-Rpc to Rest middleware."
  s.authors           = ["Ilya Lavrov"]
  s.email             = "dzjuck@gmail.com"
  s.homepage          = "http://github.com/dzjuck/json_rpc_to_rest"
  s.files             = ["lib/json_rpc_to_rest.rb"]
  # s.test_files        = ["test/config_test.rb"]

  s.require_paths     = %w[lib]
  s.rubygems_version  = '1.1.1'
  s.license           = 'MIT'

  s.add_dependency 'rack', '>= 0.4'
  s.add_development_dependency 'rspec'
end