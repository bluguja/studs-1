Rails.application.routes.draw do
   devise_for :users, controllers: { omniauth_callbacks: 'omniauth'}

  resources :home
  resources :schedules
  resources :teacherss do
    resources :schedules
  end
  resources :students
  root 'home#index'
end
