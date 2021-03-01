Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :contracts do
    get :phase_info, on: :member
    get :invoice_info, on: :member
    get :line_items, on: :member
  end
end
