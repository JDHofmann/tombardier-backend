class CreateProjectImages < ActiveRecord::Migration[6.0]
  def change
    create_table :project_images do |t|
      t.belongs_to :project, null: false, foreign_key: true
      t.string :image_caption
      t.boolean :primary

      t.timestamps
    end
  end
end
