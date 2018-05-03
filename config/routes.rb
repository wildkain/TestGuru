Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout}
  get 'sessions/new'

  root to: 'tests#index'

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
    member do
      post :start
    end
  end

  # GET test_passages/101/result
  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end


  namespace :admin do
    resources :tests
  end

end
