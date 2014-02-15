class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
    	t.string :name
    	t.text :text
    	t.belongs_to :adventure, index: true

      t.timestamps
    end
  end
end
