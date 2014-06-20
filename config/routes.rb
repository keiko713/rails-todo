Rails.application.routes.draw do
  get '/' => 'todos#index', as: :todos
  post '/' => 'todos#create'
  get ':id' => 'todos#finish', as: :todo
  delete ':id' => 'todos#destroy'
end
