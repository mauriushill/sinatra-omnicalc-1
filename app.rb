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
  
@apr = params.fetch("user_apr").to_f
@years = params.fetch("user_years").to_f.round(0)
@principal = params.fetch("user_pv").to_f

monthly_apr = (@apr / 100) / 12.00

n = @years * 12

numerator = @principal * monthly_apr * (1 + monthly_apr)**n
denominator = (1 + monthly_apr)**n - 1
@payment = (numerator / denominator).to_f.round(2)
@monthly_payment = "$#{@payment}"

@principal_currency = "$#{@principal}"

erb(:payment_results)


end

get("/random/new") do
  erb( :random_num)
end

get("/random/results") do
  
@min = params.fetch("min_num").to_f
@max = params.fetch("max_num").to_f
@random = rand(@min..@max).to_f

erb( :random_results)

end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
