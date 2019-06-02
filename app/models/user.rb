class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Userは複数のitemsを持っている
  has_many :items
  def self.import(path)
    list = []
    CSV.foreach(path,headers: true) do |row|
      list << {
        #nameのデータをユーザーモデルのnameに格納する
        name: row["name"],
        age: row["age"],
        address: row["address"]
      }
    end
      puts "インポート開始"
      User.create!(list)
      puts "インポートに成功しました"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗しました:#{invalid}"
  end
end
