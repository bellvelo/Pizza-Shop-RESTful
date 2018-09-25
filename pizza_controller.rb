require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug')

require_relative('./models/pizza_order')
also_reload('./models/*') # this reloads any changes to models sheets automatically

# index route - all the pizzas
get "/pizza_orders" do  # localhost:4567/pizza_orders
  @orders = PizzaOrder.all()
  erb (:index)
end

# create a pizza
get "/pizza_orders/new" do
  erb(:new)
end

# show one pizza
get "/pizza_orders/:id" do  # localhost:4567/pizza_orders/1
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

# create - make a pizza order
post "/pizza_orders" do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

# delete a pizza
post "/pizza_orders/:id/delete" do
  @order = PizzaOrder.find(params[:id])
  @order.delete()
  erb(:delete)
  # redirect "/pizza_orders"
end

# edit an existing order
get "/pizza_orders/:id/edit" do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

# amend an existing order
post "/pizza_orders/:id/edit" do
  @order = PizzaOrder.new(params)
  @order.update()
  erb(:update)
end
