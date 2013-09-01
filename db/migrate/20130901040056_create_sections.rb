class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :template_id
      t.integer :slide_id
      t.text :params

      t.timestamps
    end
  end
end
