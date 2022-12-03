class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :urls

  Roles = %w[admin user guest].freeze
  validates :role, inclusion: { in: Roles }

  def is?(requested_role)
    role == requested_role.to_s
  end
end
