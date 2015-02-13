class AddSubsiteToLink < ActiveRecord::Migration
  def change
    add_column :links, :subsite_name, :string
  end
end
