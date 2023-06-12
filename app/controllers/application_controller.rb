class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # GET /
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end
  # GET /users
  get "/users" do
    users = User.all
    users.to_json
  end
  # GET /users/:id
  get "/users/:id" do
    user = User.find(params[:id])
    user.to_json
  end
  # POST /users
  post "/users" do
    user = User.new(JSON.parse(request.body.read))
    if user.save
      status 201
      user.to_json
    else
      status 422
      { error: "Failed to create user" }.to_json
    end
  end
  # PUT /users/:id
  put "/users/:id" do
    user = User.find(params[:id])
    if user.update(JSON.parse(request.body.read))
      user.to_json
    else
      status 422
      { error: "Failed to update user" }.to_json
    end
  end
  # DELETE /users/:id
  delete "/users/:id" do
    user = User.find(params[:id])
    user.destroy
    status 204
  end
  # GET /categories
  get "/categories" do
    categories = Category.all
    categories.to_json
  end
  # GET /categories/:id
  get "/categories/:id" do
    category = Category.find(params[:id])
    category.to_json
  end
  # POST /categories
  post "/categories" do
    category = Category.new(JSON.parse(request.body.read))
    if category.save
      status 201
      category.to_json
    else
      status 422
      { error: "Failed to create category" }.to_json
    end
  end
  # PUT /categories/:id
  put "/categories/:id" do
    category = Category.find(params[:id])
    if category.update(JSON.parse(request.body.read))
      category.to_json
    else
      status 422
      { error: "Failed to update category" }.to_json
    end
  end
  # DELETE /categories/:id
  delete "/categories/:id" do
    category = Category.find(params[:id])
    category.destroy
    status 204
  end
  # GET /drinks
 # GET /drinks
get "/drinks" do
  drinks = Drink.includes(:category).all
  drinks.to_json(include: :category)
end
  # GET /drinks/:id
  get "/drinks/:id" do
    drink = Drink.find(params[:id])
    drink.to_json
  end
  # POST /drinks
  post "/drinks" do
    drink = Drink.new(JSON.parse(request.body.read))
    if drink.save
      status 201
      drink.to_json
    else
      status 422
      { error: "Failed to create drink" }.to_json
    end
  end
  # PUT /drinks/:id
  put "/drinks/:id" do
    drink = Drink.find(params[:id])
    if drink.update(JSON.parse(request.body.read))
      drink.to_json
    else
      status 422
      { error: "Failed to update drink" }.to_json
    end
  end
  # DELETE /drinks/:id
  delete "/drinks/:id" do
    drink = Drink.find(params[:id])
    drink.destroy
    status 204
  end
  # GET /drinks/search
  get "/drinks/search" do
    search_term = params[:q]
    drinks = Drink.where("name LIKE ?", "%#{search_term}%")
    drinks.to_json
  end
  # GET /brands
  get "/brands" do
    brands = Drink.select(:brand).distinct
    brands.to_json
  end
  # GET /brands/:brand
  get "/brands/:brand" do
    drinks = Drink.where(brand: params[:brand])
    drinks.to_json
  end
  # POST /users
post "/users" do
  user_params = JSON.parse(request.body.read)
  user = User.new(user_params)
  if user.save
    status 201
    user.to_json
  else
    status 422
    { error: "Failed to create user" }.to_json
  end
end
post '/login' do
  puts "Received login request: #{params}"
  email = params[:email]
  user = User.find_by(email: email)
  if user
    # User found
    # Perform your custom authentication here based on email
    # Assuming you have a custom authentication method called 'authenticate_by_email'
    if user.authenticate_by_email(email)
      # Authentication successful
      # You can generate and return a token or session information here
      { message: 'Login successful' }.to_json
    else
      # Authentication failed
      status 401
      { error: 'Authentication failed' }.to_json
    end
  else
    # User not found
    status 404
    { error: 'User not found' }.to_json
  end
end
end