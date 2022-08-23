class AddShowAndActiveAndIconAndStyleToTags < ActiveRecord::Migration[7.0]
  def change
    add_column :tags, :show, :string
    add_column :tags, :active, :boolean
    add_column :tags, :icon, :string
    add_column :tags, :style, :string
  end
end
