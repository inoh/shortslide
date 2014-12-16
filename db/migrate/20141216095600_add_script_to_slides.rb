class AddScriptToSlides < ActiveRecord::Migration
  def self.up
    add_column :slides, :script, :text
    add_column :slides, :style, :text
  end

  def self.down
    remove_column :slides, :script, :text
    remove_column :slides, :style, :text
  end
end
