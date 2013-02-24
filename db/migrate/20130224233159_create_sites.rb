class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :desc
      t.string :key
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
