#includo l'array delle n locale di default
include LocalesHelper

class CategoriesI18n < ApplicationRecord

  enum locale: all_locales.index_by(&:itself), _prefix: :locale
  belongs_to :category
  # creo un validazione dove name e locale devono essere presenti
  validates :name , :locale , presence: true
  # creo un validazione dove locale deve essere univoco nell'ambito della tabella categories (category model)
  validates :locale, :uniqueness => {scope: :category}

end
