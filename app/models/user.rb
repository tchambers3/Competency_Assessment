class User < ActiveRecord::Base
  has_secure_password

  validate_presence_of :username
  validate_uniqueness_of :username
  # Need to be added when the controller is created
  # validates_presence_of :password, on: :create
  # validates_presence_of :password_confirmation, on: :create
  # validates_confirmation_of :password, message: "does not match"
  # validates_length_of :password, minimum: 6, message: "Password too short. Must be at least 6 characters", allow_blank: true

  scope :alphabetical, -> {order("username")}
  scope :find_by_username, -> (username) {where("username = ?", username)}
end
