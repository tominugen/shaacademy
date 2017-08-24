class AddImageUrlToProject < ActiveRecord::Migration
  def change
    add_column :projects, :image_url, :string
    remove_column :projects,  "image_file_name"
    remove_column :projects,  "image_content_type"
    remove_column :projects, "image_file_size"
    remove_column :projects, "image_updated_at"
  end
end
