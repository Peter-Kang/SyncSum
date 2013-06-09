Syfs::Application.routes.draw do
  root :to => "users#dashboard"

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :candidate_apps
  resources :employee_applications
  resources :user_blocks

  resources :questions do
    collection do
      get 'answers'
    end
    member do
      get 'answer' => 'questions#answer'
      post 'answer' => 'questions#answer_question', :as => 'answer_this'
      put 'answer' => 'questions#update_answer'
    end
  end
  
  resources :educations
  resources :experiences, only: [:new, :create, :show]
  resources :positions
  resources :schools, only: [:index]
  resources :candidates_concentrations_degrees

  resources :users do
    collection do
      get :login
      get :choose_type
      get :dashboard
    end
  end

  resources :employers do
    collection do
      get :question
      match 'search' => 'employers#search', :via => [:get, :post], :as => :search
    end
  end

  resources :candidates do
    collection do
      get :question
      put :update
    end
  end

  resources :messages do
    collection do
      get :inbox
      get :compose
      get :display
    end
  end

  match "login"     => "users#login",     :as => "login"
  match "dashboard" => "users#dashboard", :as => "dashboard"
  match "profile"   => "users#show",      :as => "profile"
end
