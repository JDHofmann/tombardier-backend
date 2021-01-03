class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :bio
      t.string :contact_email
      t.string :site_title
      t.string :site_subtitle

      t.timestamps
    end
  end
end
