FsRapidProto::Application.routes.draw do

  devise_for :admins, controllers: { sessions: "sessions", registrations: "registrations" }, skip: [:registrations]
  as :admin do
    get 'admins/edit' => 'registrations#edit', :as => 'edit_admin_registration'
    put 'admins' => 'registrations#update', :as => 'admin_registration'

    # The following are commented because we subclassed registrations controller to change the redirect path (after update):
    # So, now we should point to that subclass, not the original devise controller!
    #
    # get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
    # put 'admins' => 'devise/registrations#update', :as => 'admin_registration'
  end

  resources :visitors, only: [:new, :create]
  resources :visits, only: [:new, :create]

  get "index/welcome"
  get "index/returning"

  namespace :admin do
    resources :visits, only: [:index, :show] do
      member do
        post 'doCheckout'
      end
    end
  end

  # root path of the application:
  root 'index#welcome'

end
