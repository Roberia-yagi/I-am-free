class Connection < ApplicationRecord
  def self.already_queued?(current_user, other_user)
    if Connection.where(userid_1: current_user.id, userid_2: other_user.id).exists?
      true
    else
      false
    end
  end

  def self.in_queue(current_user, other_user)
    return false if Connection.where(userid_1: other_user.id, userid_2: current_user.id).exists?

    Connection.create!(userid_1: current_user.id, userid_2: other_user.id)
    true
  end
end
