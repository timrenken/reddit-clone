class AddSubsiteIdToLink < ActiveRecord::Migration
  def change
    add_column :links, :subsite_id, :integer
  end
end
