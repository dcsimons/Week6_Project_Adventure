AdventureLibrary::Application.routes.draw do
  root to: "libraries#index"
 
  resources :adventures do
    resources :pages
  end
  
end
