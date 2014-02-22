class AddRelationToUsers < ActiveRecord::Migration
  def self.up
    change_table(:images) do |t|
      t.integer :user_id
    end
    change_table(:slides) do |t|
      t.integer :user_id
    end
    # TODO ユーザはひとりしかいないことが前提
    Image.update_all(user_id: User.last.id)
    Slide.update_all(user_id: User.last.id)
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
