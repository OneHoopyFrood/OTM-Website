class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true
      t.text :bio
      t.date :service_start
      t.date :service_end
      t.string :facebook
      t.string :twitter
      t.string :g_plus
      t.string :areas
      t.string :presidents

      t.timestamps null: false
    end
    add_foreign_key :profiles, :users
  end
end
