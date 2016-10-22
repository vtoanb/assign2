require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  before_save { self.email = email.downcase }

  has_secure_password

  attr_accessor :remember_token

  has_one :inbox
  has_many :messages, through: :inbox
  has_many :recipients
  has_many :messages, through: :recipients

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def authenticated?(remember_token)
    # this is for catch error happen when authenticate forgeted user by other browser
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

end
