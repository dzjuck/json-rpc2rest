class JsonRpcToRest
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
  end

  def json_rpc_present?
    @env['rack.request.form_hash'] && @env['rack.request.form_hash'][@field]
  end

  def path
    @path ||= @env['PATH_INFO'].chomp('/')
  end

  def new_path
    path << '/' + @env['rack.request.form_hash'][@field]
  end

  def change_path(path)
    original_path = @env['PATH_INFO']
    @env['PATH_INFO'] = path
    @env['REQUEST_URI'].sub!(original_path, path)
  end
end

