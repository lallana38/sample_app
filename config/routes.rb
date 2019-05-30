Rails.application.routes.draw do
  # 一覧画面へのルーティング
  get '/users', to: 'users#index'
  # 新規投稿画面へのルーティング
  get 'users/new', to: 'users#new'
  # 新規登録を行うためのルーティング
  post '/users', to: 'users#create'
  # 編集画面へのルーティング
  get '/users/:id/edit', to: 'users#edit'
  # 更新を行うためのルーティング
  patch '/users/:id', to: 'users#update'
  # 削除を行うためのルーティング
  delete '/users/:id', to: 'users#destroy'
  # 更新を行うためのルーティング
  patch '/users/:id', to: 'users#update'
end
