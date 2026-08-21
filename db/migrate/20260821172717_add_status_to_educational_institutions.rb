class AddStatusToEducationalInstitutions < ActiveRecord::Migration[8.1]
  def change
    add_column :educational_institutions, :status, :string, default: "active"
  end
end
