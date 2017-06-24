class User < ApplicationRecord
  authenticates_with_sorcery!

  # Validations
  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true

  def self.search(user_search)
    @users = User.all
    @users = @users.where('email like ?', "#{user_search.email}%")
  end
end
