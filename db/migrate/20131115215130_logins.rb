class Logins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :email
      t.string :password
    end
  end
end
