class ChangeEmailToBeCaseInsensitive < ActiveRecord::Migration
  def change
    enable_extension :citext
    change_column :users, :email, :citext
    add_index :users, :email, unique: true # If you want to index the email
  end
end
