class AddWebsiteToOptions < ActiveRecord::Migration[5.2]
  def change
    add_column :options, :website, :string
  end
end
