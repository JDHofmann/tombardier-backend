class CreateUserLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_links do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :link_text
      t.string :link_url
      t.boolean :primary

      t.timestamps
    end
  end
end
