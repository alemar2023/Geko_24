class Category < ApplicationRecord

  has_many :categories_i18n
  accepts_nested_attributes_for :categories_i18n
  has_one :en_translation, -> { where(locale: "en")} , class_name: "CategoriesI18n"

end
