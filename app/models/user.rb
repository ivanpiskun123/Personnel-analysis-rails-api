class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
       :trackable, :rememberable, :validatable, :registerable

  validates :name, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true

  has_many :candidates

  def admin_prefix
    self.is_admin ? "Администратор " : ""
  end

end
