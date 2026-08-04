class CreateEducationalInstitutions < ActiveRecord::Migration[8.1]
  def change
    create_table :educational_institutions do |t|
      t.string :name
      t.string :cnpj
      t.string :tipo

      t.timestamps
    end
  end
end
