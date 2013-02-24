class CreateUserSessions < ActiveRecord::Migration
  def change
    create_table :user_sessions do |t|
      t.date :endtime
      t.integer :duration
      t.string :pagename

      t.timestamps
    end
  end
end
