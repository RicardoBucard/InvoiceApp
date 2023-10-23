class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :auth_token

      t.timestamps
    end
    add_index :users, :auth_token, unique: true
  end
end
