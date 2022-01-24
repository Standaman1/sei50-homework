Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'magiceightballs#home'

  get 'magiceightballs/:questionasked' => 'magiceightballs#question'


end
