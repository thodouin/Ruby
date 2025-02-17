class AddStepToWeightEntries < ActiveRecord::Migration[7.2]
  def change
    add_column :weight_entries, :step, :integer
  end
end
