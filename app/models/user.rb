class User < ApplicationRecord
  has_many :apartments
  devise  :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
  :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
end
