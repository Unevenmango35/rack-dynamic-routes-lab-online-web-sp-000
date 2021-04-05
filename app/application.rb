class Application

  @@items = ["donut", 1.25, "water bottl", 2.00]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
    item_name = req.path.split("/item/").last
    if item=@@item.find{|i| i.name == item_name}
        resp.write item.price
    else
      resp.status = 400
      resp.write "Item Not Found"
    end

   else
     resp.status = 404
     resp.write "Route Not Found"
  end

    resp.finish
  end
end
