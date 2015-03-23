class JsonRpcToRest
  def initialize(app)
    @app = app
  end
  
  def call(env)
    if env["rack.request.form_hash"] && env["rack.request.form_hash"]["method"]
        original_path = env["PATH_INFO"]
        path = original_path.dup
        
        path.chomp!('/')
        path << "/" + env["rack.request.form_hash"]["method"]

        env["PATH_INFO"] = path
        env["REQUEST_URI"].sub!(original_path, path)
    end
    puts env["PATH_INFO"]
    puts env["REQUEST_URI"]
    @app.call(env)
  end
end

