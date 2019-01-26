Rails.application.routes.draw do
  
  root 'inpo#index'
  get 'inpo/index'
  get 'inpo/battle'
  get 'inpo/license'
  get 'inpo/battle2'
  get 'inpo/dump'
  get 'inpo/play'
  get 'inpo/play2'
  post 'inpo/wingame'
  post 'inpo/losegame'
  get 'inpo/record'
  get 'inpo/contact'
  post 'inpo/submit'
  get 'inpo/tutorial'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
