class AddImagenUrlToEvento < ActiveRecord::Migration[7.0]
  def change
    add_column :eventos, :imagen_url, :string
  end
end
