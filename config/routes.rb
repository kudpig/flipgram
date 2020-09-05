Rails.application.routes.draw do
  root to: 'top#index'

  resources :users, only: %i[new create]
  resources :posts do
    resources :comments, shallow: true
  end
  # shallowオプションについてはRailsガイド'ルーティング'の2.7.2を参考に記述
  # comment_idをparamsに持つアクション(show/edit/update/destroy)についてURLを短くすることができる。
  # (urlを短くしても一意性を確保出来ている)

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
