class ChangeTagActiveDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :tags, :active, false
  end
end
