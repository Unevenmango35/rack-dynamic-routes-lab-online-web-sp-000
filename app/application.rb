class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end

    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)

    elsif req.path.match(/cart/) && @@cart.size == 0
      resp.write "Your cart is empty"

    elsif req.path.match(/cart/) && @@cart.size > 0
      @@cart.each do |cart_item|
      resp.write "#{cart_item}\n"
    end

    elsif req.path.match(/add/)
    search_term = req.params["item"]
    resp.write handle_add(search_term)

    else
      resp.write "Path Not Found"
    end

    resp.finish
  end


end
