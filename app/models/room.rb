class Room < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :comments, as: :commentable

  def join(user:)
    return true if self.users.include?(user)

    if self.users << user
      return true
    else
      return false
    end
  end
end
