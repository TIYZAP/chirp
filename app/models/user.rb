class User < ApplicationRecord

  has_secure_password
  has_secure_token :api_token
  has_many :shouts
  acts_as_follower
  acts_as_followable
  attachment :avatar

  validates :email,
            presence: true,
            uniqueness: true,
            format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i





end
