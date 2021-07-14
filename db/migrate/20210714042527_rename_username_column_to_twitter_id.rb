class RenameUsernameColumnToTwitterId < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :username, :twitter_id
  end
end
