class RemoveHashedPasswordFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :hashed_password, :string
  end
end
