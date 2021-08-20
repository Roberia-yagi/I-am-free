class User < ApplicationRecord
  validates :provider, presence: true
  validates :uid, presence: true
  validates :twitter_id, presence: true
  validates :image_url, presence: true

  has_many :users, through: :relationships

  def self.find_or_create_from_auth_hash!(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    twitter_id = auth_hash[:info][:nickname]
    image = auth_hash[:info][:image]

    exist_user = User.find_or_create_by!(provider: provider, uid: uid) do |user|
      user.twitter_id = twitter_id
      user.image_url = image
    end

    exist_user.update(twitter_id: twitter_id) unless exist_user.twitter_id == twitter_id
    exist_user
  end

  def friend?(other_user)
    if id < other_user.id
      Relationship.find_by(friend1_id: id, friend2_id: other_user.id)
    else
      Relationship.find_by(friend1_id: other_user.id, friend2_id: id)
    end
  end

  def add_friend(other_user)
    return false if friend?(other_user)

    Relationship.create!(friend1_id: id, friend2_id: other_user.id)

    Relationship.create!(friend1_id: other_user.id, friend2_id: id)
    true
  end

  def remove_friend(other_user)
    return false unless friend?(other_user)

    Relationship.find_by(friend1_id: id, friend2_id: other_user.id).destroy

    Relationship.find_by(friend1_id: other_user.id, friend2_id: id).destroy
    true
  end
end