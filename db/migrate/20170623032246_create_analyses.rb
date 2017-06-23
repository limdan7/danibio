class CreateAnalyses < ActiveRecord::Migration
  def change
    create_table :analyses do |t|
      t.string :input_dna
      
      t.timestamps null: false
    end
  end
end
