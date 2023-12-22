class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  belongs_to :user_role

  def admin?
    UserRole::ADMIN_TAG == self.user_role.tag
  end

  def customer?
    UserRole::CUSTOMER_TAG == self.user_role.tag
  end

  def destroy
  end

=begin
  def active_for_authentication?
    super && !deactivated
  end
=end

end
