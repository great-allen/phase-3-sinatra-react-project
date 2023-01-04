class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get '/lists' do
    lists=ToDoList.all.order(created_at: :desc)
    lists.to_json(include: {category: {only: [:category]}})
  end

  # get '/lists_by_category' do
  #   lists = ToDoList.all.order(:category)
  #   lists.to_json(include: {category: {only: [:category]}})
  # end

  

  post '/lists' do
    lists=ToDoList.create(
      content:params[:content],
      category_id: params[:category_id]
    )
    lists.to_json(include: {category: {only: [:category]}})

  end

  delete "/lists/:id" do
    lists = ToDoList.find(params[:id])
    lists.destroy
    lists.to_json
  end

  patch "/lists/:id" do
    lists = ToDoList.find(params[:id])
    lists.update(content: params[:content],
      category_id: params[:category_id]
    )
    lists.to_json(include: { category: {only: [:category]} })
  end

  get "/categories" do
    categories = Category.all
    categories.to_json
  end

end
