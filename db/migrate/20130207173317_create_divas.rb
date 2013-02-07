class CreateDivas < ActiveRecord::Migration
  def change
    create_table :divas do |t|
      t.string :name

      t.timestamps
    end
  end
end
