class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, presence: true, unique: true
      t.string :password_digest, presence: true
      t.string :session_token, presence: true

    end

    add_index :users, :session_token, unique: true
  end
end
