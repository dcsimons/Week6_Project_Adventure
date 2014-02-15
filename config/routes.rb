AdventureLibrary::Application.routes.draw do
  root to: "libraries#index"
  get "/libraries", to: "libraries#index", as: "libraries"
 
  resources :adventures do
    resources :pages
  end
  
end
