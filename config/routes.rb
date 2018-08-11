Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, defaults: {format: :json}
  resources :helper, defaults: {format: :json}
  resources :helper_types, defaults: {format: :json}
  resources :user_requests, defaults: {format: :json}

  scope '/retrieve_request' do
    post '/' => 'user_requests#filter_request'
  end

  scope '/update_helper_location' do
    post '/:id' => 'helper#update_location'
  end

  # scope '/api' do
  #   scope '/v1' do
  #     scope '/projects' do
  #       get '/' => 'api_projects#index'
  #       post '/' => 'api_projects#create'
  #       scope '/:name' do
  #         get '/' => 'api_projects#show'
  #         put '/' => 'api_projects#update'
  #         scope '/todos' do
  #           get '/' => 'api_todos#index'
  #           post '/' => 'api_todos#create'
  #           scope '/:todo_name' do
  #             get '/' => 'api_todos#show'
  #             put '/' => 'api_todos#update'
  #           end
  #         end
  #       end
  #     end
  #   end
  # end
  #
  # GET    /api/v1/projects(.:format)                                                               api_projects#index
  # POST   /api/v1/projects(.:format)                                                               api_projects#create
  # GET    /api/v1/projects/:name(.:format)                                                         api_projects#show
  # PUT    /api/v1/projects/:name(.:format)                                                         api_projects#update
  # GET    /api/v1/projects/:name/todos(.:format)                                                   api_todos#index
  # POST   /api/v1/projects/:name/todos(.:format)                                                   api_todos#create
  # GET    /api/v1/projects/:name/todos/:todo_name(.:format)                                        api_todos#show
  # PUT    /api/v1/projects/:name/todos/:todo_name(.:format)                                        api_todos#update

end
