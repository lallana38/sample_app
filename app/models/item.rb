class Item < ApplicationRecord
  # Itemはひとりのユーザーに所属している
  belongs_to :user
end
