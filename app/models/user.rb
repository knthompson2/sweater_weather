class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_secure_password

  def create_api_key
    self.api_key = SecureRandom.base64.tr('+/=', 'Qrt')
  end
end
