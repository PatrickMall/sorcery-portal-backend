Rails.application.routes.draw do
  get 'current_user', to: 'current_user#index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace 'api' do
    namespace 'v1' do
      resources :answers do
        collection do
          delete 'destroy_all'
        end
      end
      resources :users
      resources :questions
      resources :moodboards
    end
  end
end
