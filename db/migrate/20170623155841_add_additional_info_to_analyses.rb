class AddAdditionalInfoToAnalyses < ActiveRecord::Migration
  def change
    add_column :analyses, :translation_from_dna, :array
  end
end
