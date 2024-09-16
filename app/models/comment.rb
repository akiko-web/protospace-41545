class Comment < ApplicationRecord
  belongs_to :user  # tweetsテーブルとのアソシエーション
  belongs_to :prototype  # usersテーブルとのアソシエーション
    
  validates :content, presence: true
end
