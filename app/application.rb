class Application

  @@items = ["donut", 1.25, "water bottl", 2.00]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end

    else
      resp.write "Item Not Found"
      resp.status = 400
    end

    resp.finish
  end


end
