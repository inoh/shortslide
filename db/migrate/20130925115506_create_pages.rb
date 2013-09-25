class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :slide_id
      t.text :content

      t.timestamps
    end
  end
end
