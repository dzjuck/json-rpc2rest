require 'json'
require 'rack'

class JsonRpc2Rest
  def initialize(app, options={})
    @app = app
    @field = options[:field] || 'method'
  end
  
  def call(env)
    init_call(env)

    change_path(new_path) if json_rpc_present?

    @app.call(env)
  end

private 

  def init_call(env)
    @env = env
    @path = nil

    req_body = Rack::Request.new(env).body.read
    if env['REQUEST_METHOD'] == 'POST'
      @params = parse_req_body(req_body)
    else
      @params ||= {}
    end
  end

  def json_rpc_present?
    @params && @params[@field]
  end

  def path
    @path ||= @env['PATH_INFO'].chomp('/')
  end

  def new_path
    path << '/' + @params[@field]
  end

  def change_path(path)
    original_path = @env['PATH_INFO']
    @env['PATH_INFO'] = path
    @env['REQUEST_URI'].sub!(original_path, path)
  end

  def req_body_present?(req_body)
    !req_body.nil? && !req_body.empty?
  end

  def parse_req_body(req_body)
    JSON.parse(req_body)
  rescue JSON::ParserError => e
    {}
  rescue TypeError => e
    {}
  end
end
