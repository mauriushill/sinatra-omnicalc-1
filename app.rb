require "sinatra"
require "sinatra/reloader"

get("/howdy") do
erb( :hello)
end

get("/square/new") do
  erb( :square)
end

get("/square/results") do
  @the_num = params.fetch("user_number").to_f
  @the_results = @the_num ** 2
  
  erb( :square_results)
 
end

get("/square_root/new") do
  erb( :squareroot)
end

get("/square_root/results") do
  
  @the_root = params.fetch("user_number").to_f
  @the_root_results = @the_root ** 0.5
  
  erb( :squareroot_results)
end

get("/payment/new") do
  erb( :payment_num)
end

get("/payment/results") do
  erb( :payment_results)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
