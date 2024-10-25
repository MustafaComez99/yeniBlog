class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :articles, dependent: :destroy
  has_many :comments # buraya dependent eklemeye gerek yok çünkü xaten comment articlea bağımlı.
  self.filter_attributes = [ :password ]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
