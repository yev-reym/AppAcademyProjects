require 'rack'

class LiteApp

    def call(env)
        request = Rack::Request.new(env) 
        response = Rack::Response.new 
        response['Content-Type'] = 'html'
        response.write("<h1>Hello World</h1>")
        response.write(request.path)
        response.finish
    end

end

Rack::Server.start(
    app: LiteApp.new,
    Port: 3000
)
