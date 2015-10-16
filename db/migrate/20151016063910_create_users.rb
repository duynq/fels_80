class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.boolean :admin
      t.string :avatar
      t.string :remember_digest

      t.timestamps null: false
    end
  end
end
