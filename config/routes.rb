Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout},
             controllers: {sessions: 'users/sessions'}
  get 'sessions/new'

  get 'pages/contact', to: "pages#contact", as: :contact
  post 'pages/contact', to: "pages#send_mail", as: :contact_us

  root to: 'tests#index'

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  # GET test_passages/101/result
  resources :test_passages, only: %i[show update] do
    get :result, on: :member
    post :gist, on: :member
  end


  namespace :admin do
    resources :feedbacks, only: :index
    resources :gists, only: :index
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

end
