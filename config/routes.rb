Rails.application.routes.draw do
  root to: 'tests#index'

  # Main resources
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout},
             controllers: {sessions: 'users/sessions'}
  get 'sessions/new'

  # Admin namespace
  namespace :admin do
    resources :feedbacks, only: :index
    resources :gists, only: :index
    resources :badges
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

  #Common resources
  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
    post :gist, on: :member
  end

  resources :feedbacks, only: %i[new create]

  resources :badges, only: :index

end
