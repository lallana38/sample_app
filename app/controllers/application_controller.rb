class ApplicationController < ActionController::Base
  # devise_controller(ログイン機能を使ったときに動作するコントローラー)が実行されたらconfigure_permitted_parametersが先に実行される
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン機能を利用してニックネームを登録しようとした時にどういうパラメータが許可できるか
  def configure_permitted_parameters
    # signupするときにキーとしてnicknameを登録する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
