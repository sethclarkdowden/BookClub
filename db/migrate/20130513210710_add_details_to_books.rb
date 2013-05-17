class AddDetailsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :title, :string
    add_column :books, :publisher, :string
    add_column :books, :published_date, :string
    add_column :books, :description, :string
    add_column :books, :isbn_10, :integer
    add_column :books, :isbn_13, :integer
    add_column :books, :page_count, :integer
    add_column :books, :average_rating, :integer
    add_column :books, :ratings_count, :integer
    add_column :books, :language, :string
    add_column :books, :preview_link, :string
    add_column :books, :info_link, :string
    add_column :books, :image_link, :string
    remove_column :books, :name
  end
end
