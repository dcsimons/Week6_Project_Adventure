AdventureLibrary::Application.routes.draw do
  root to: "libraries#home"
  get "/libraries", to: "libraries#index", as: "libraries"
  post "/libraries", to: "libraries#create"
 
  resources :adventures do
    resources :pages
  end
  
end
