class CreateCategoriesI18ns < ActiveRecord::Migration[7.1]
  def change
    create_table :categories_i18ns do |t|
      t.bigint :category_id
      t.string :name, null: false
      t.string :locale, null: false
      t.text :description
      t.text :description_extra

      t.timestamps
    end
    add_index :categories_i18ns, :name
    add_index :categories_i18ns, :locale
    add_index :categories_i18ns, [:locale , :category_id ], unique: true

  end
end
