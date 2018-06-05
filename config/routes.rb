Rails.application.routes.draw do
  # Routes for the Bean_drink resource:
  # CREATE
  get "/bean_drinks/new", :controller => "bean_drinks", :action => "new"
  post "/create_bean_drink", :controller => "bean_drinks", :action => "create"

  # READ
  get "/bean_drinks", :controller => "bean_drinks", :action => "index"
  get "/bean_drinks/:id", :controller => "bean_drinks", :action => "show"

  # UPDATE
  get "/bean_drinks/:id/edit", :controller => "bean_drinks", :action => "edit"
  post "/update_bean_drink/:id", :controller => "bean_drinks", :action => "update"

  # DELETE
  get "/delete_bean_drink/:id", :controller => "bean_drinks", :action => "destroy"
  #------------------------------

  # Routes for the Drink resource:
  # CREATE
  get "/drinks/new", :controller => "drinks", :action => "new"
  post "/create_drink", :controller => "drinks", :action => "create"

  # READ
  get "/drinks", :controller => "drinks", :action => "index"
  get "/drinks/:id", :controller => "drinks", :action => "show"

  # UPDATE
  get "/drinks/:id/edit", :controller => "drinks", :action => "edit"
  post "/update_drink/:id", :controller => "drinks", :action => "update"

  # DELETE
  get "/delete_drink/:id", :controller => "drinks", :action => "destroy"
  #------------------------------

  # Routes for the Bean resource:
  # CREATE
  get "/beans/new", :controller => "beans", :action => "new"
  post "/create_bean", :controller => "beans", :action => "create"

  # READ
  get "/beans", :controller => "beans", :action => "index"
  get "/beans/:id", :controller => "beans", :action => "show"

  # UPDATE
  get "/beans/:id/edit", :controller => "beans", :action => "edit"
  post "/update_bean/:id", :controller => "beans", :action => "update"

  # DELETE
  get "/delete_bean/:id", :controller => "beans", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
