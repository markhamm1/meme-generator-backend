class CreateMonsters < ActiveRecord::Migration[6.0]
  def change
    create_table :monsters do |t|
      t.string :top_text
      t.string :bottom_text
      t.string :head_url
      t.string :body_url
      t.string :leg_url
      t.integer :user_id

      t.timestamps
    end
  end
end
