class UsersController < ApplicationController

  # 一覧画面に対応するアクション
  def index
    @users = User.all
  end
  # 新規作成画面に対応するアクション
  def new
    @user = User.new
  end
  # 新規登録するためのアクション
  def create
    User.create(user_params)
  end

  # 詳細情報を表示するためのアクション
  def show
    # @user = User.find(params[:id])

    # # 購入したユーザーのidに紐付いて商品が検索される
    # # user_idカラムがcurrent_user.idと同じものを検索する
    # @items = Item.where(user_id: current_user.id)
    @user = User.find(current_user.id)

  end

  # 編集画面に対応するアクション
  # 該当するuserのレコードを取得してビューに表示
  def edit
    @user = User.find(params[:id])
  end

  # 更新を行うためのアクション
  def update
    user = User.find(params[:id])
    user.update(user_params)
  end

  # 削除をするためのアクション
  def destroy
    user = User.find(params[:id])
    user.delete
  end

  private

  def user_params
    params.require(:user).permit(:name,:age)
  end
end
