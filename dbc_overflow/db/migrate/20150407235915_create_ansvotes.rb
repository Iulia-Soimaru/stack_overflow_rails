class CreateAnsvotes < ActiveRecord::Migration
  def change
    create_table :ansvotes do |t|
      t.references :answer
      t.timestamps
    end
  end
end
