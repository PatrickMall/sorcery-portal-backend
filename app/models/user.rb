class User < ApplicationRecord
  has_many :answers,
  dependent: :destroy
  has_many :moodboards,
  dependent: :destroy
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validates :first_name, :last_name, :phone_number, presence: true      
      
end
