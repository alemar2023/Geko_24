require "application_system_test_case"

class CategoriesI18nsTest < ApplicationSystemTestCase
  setup do
    @categories_i18n = categories_i18ns(:one)
  end

  test "visiting the index" do
    visit categories_i18ns_url
    assert_selector "h1", text: "Categories i18ns"
  end

  test "should create categories i18n" do
    visit categories_i18ns_url
    click_on "New categories i18n"

    fill_in "Category", with: @categories_i18n.category_id
    fill_in "Description", with: @categories_i18n.description
    fill_in "Description extra", with: @categories_i18n.description_extra
    fill_in "Locale", with: @categories_i18n.locale
    fill_in "Name", with: @categories_i18n.name
    click_on "Create Categories i18n"

    assert_text "Categories i18n was successfully created"
    click_on "Back"
  end

  test "should update Categories i18n" do
    visit categories_i18n_url(@categories_i18n)
    click_on "Edit this categories i18n", match: :first

    fill_in "Category", with: @categories_i18n.category_id
    fill_in "Description", with: @categories_i18n.description
    fill_in "Description extra", with: @categories_i18n.description_extra
    fill_in "Locale", with: @categories_i18n.locale
    fill_in "Name", with: @categories_i18n.name
    click_on "Update Categories i18n"

    assert_text "Categories i18n was successfully updated"
    click_on "Back"
  end

  test "should destroy Categories i18n" do
    visit categories_i18n_url(@categories_i18n)
    click_on "Destroy this categories i18n", match: :first

    assert_text "Categories i18n was successfully destroyed"
  end
end
