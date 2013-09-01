class CreateTemplateAttributes < ActiveRecord::Migration
  def change
    create_table :template_attributes do |t|
      t.integer :template_id
      t.string :name

      t.timestamps
    end
  end
end
