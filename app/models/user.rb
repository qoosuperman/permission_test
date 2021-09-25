class User < ApplicationRecord
  # 一個 user 歸屬一個 group
  belongs_to :user_group
  has_many :enabled_permissions, through: :user_group
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books
end