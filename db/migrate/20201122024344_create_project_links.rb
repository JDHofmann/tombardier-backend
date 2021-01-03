class CreateProjectLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :project_links do |t|
      t.belongs_to :project, null: false, foreign_key: true
      t.string :link_text
      t.string :link_url

      t.timestamps
    end
  end
end
