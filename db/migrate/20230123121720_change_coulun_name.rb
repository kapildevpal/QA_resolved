class ChangeCoulunName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :company, :company_name

  end
end
