class AddBeginAtToRentingPhase < ActiveRecord::Migration[6.1]
  def change
    add_column :renting_phases, :begin_at, :datetime
    add_column :renting_phases, :end_at, :datetime
  end
end
