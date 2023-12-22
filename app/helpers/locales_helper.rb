module LocalesHelper

  def all_locales
    ["en", "it", "es", "de", "ja"]
  end

  def all_locales_for_select
    all_locales.map{ | l | [l, l] }
  end

end