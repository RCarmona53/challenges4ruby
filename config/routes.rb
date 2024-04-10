Rails.application.routes.draw do
  devise_for :users
  devise_for :user_admins

end
