class User < ApplicationRecord
  validates :provider, presence: true
  validates :uid, presence: true
  validates :username, presence: true
  validates :image_url, presence: true

  has_many :users, through: :relationships

  def self.find_or_create_from_auth_hash!(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    username = auth_hash[:info][:name]
    image = auth_hash[:info][:image]

    User.find_or_create_by!(provider: provider, uid: uid) do |user|
      user.username = username
      user.image_url = image
    end
  end

  def friend?(other_user)
    if id < other_user.id
      Relationship.find_by(friend1_id: id, friend2_id: other_user.id)
    else
      Relationship.find_by(friend1_id: other_user.id, friend2_id: id)
    end
  end

  def add_friend(other_user)
    return false if Relationship.where(friend1_id: id, friend2_id: other_user.id).exists?

    return false if Relationship.where(friend1_id: id, friend2_id: other_user.id).exists?

    Relationship.create!(friend1_id: id, friend2_id: other_user.id)

    Relationship.create!(friend1_id: other_user.id, friend2_id: id)
    true
  end

  def remove_friend(other_user)
    return false unless Relationship.where(friend1_id: id, friend2_id: other_user.id).exists?

    return false unless Relationship.where(friend1_id: id, friend2_id: other_user.id).exists?

    Relationship.find_by(friend1_id: id, friend2_id: other_user.id).destroy

    Relationship.find_by(friend1_id: other_user.id, friend2_id: id).destroy
    true
  end
end
