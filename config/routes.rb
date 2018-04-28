Rails.application.routes.draw do

  resources :tests do
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

end
