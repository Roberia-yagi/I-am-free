class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.integer :userid_1
      t.integer :userid_2

      t.timestamps
    end
  end
end
