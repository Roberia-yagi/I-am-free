class Relationship < ApplicationRecord
  validate :same_person?
  has_many :users, through: :relationships

  def same_person?
    errors.add(:friend1_id, ':Cannot add myself') if friend1_id == friend2_id
  end
end
