Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Create---------------------------------

  #1. Blank form

  get 'mountains/new' => 'mountains#new', as: 'new_mountain'

  #2.Form submits here, save to DB, redirecrt

  post '/mountains' => 'mountains#create'

  #READ----------------------------------


  #1. Index page, i.e list every row of mountains table

  get '/mountains' => 'mountains#index'


  #2. Show page, details of one mountain by ID


  get '/mountains/:id' => 'mountains#show', as: 'mountain' #gives 'mountain_path(ID_HERE)



  #Update-------------------------------

  #1. Show pre-filled edit form

  get '/mountains/:id/edit' => 'mountains#edit', as: 'edit_mountain'


  #2. Form submits here, do DB update, redirect

  patch '/mountains/:id' => 'mountains#update'


  #Delete------------------------------

  get 'mountains/:id/delete' => 'mountains#destroy', as: 'destroy_mountain'

end
