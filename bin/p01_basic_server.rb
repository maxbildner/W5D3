require 'rack'

require "byebug"


class RackApplication
  def self.call(env)
    app = Proc.new do |env|
    req = Rack::Request.new(env)
    res = Rack::Response.new
  
    name = req.params['message']
    res['Content-Type'] = 'text/html'
    res.write(req.path)
    res.finish
    end
  end

end

Rack::Server.start(
  app: app,
  Port: 3000
)