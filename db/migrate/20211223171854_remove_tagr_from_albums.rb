class RemoveTagrFromAlbums < ActiveRecord::Migration[6.1]
  def change
    remove_column :albums, :tag, :string
  end
end
