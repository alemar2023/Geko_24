require "test_helper"

class CategoriesI18nsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categories_i18n = categories_i18ns(:one)
  end

  test "should get index" do
    get categories_i18ns_url
    assert_response :success
  end

  test "should get new" do
    get new_categories_i18n_url
    assert_response :success
  end

  test "should create categories_i18n" do
    assert_difference("CategoriesI18n.count") do
      post categories_i18ns_url, params: { categories_i18n: { category_id: @categories_i18n.category_id, description: @categories_i18n.description, description_extra: @categories_i18n.description_extra, locale: @categories_i18n.locale, name: @categories_i18n.name } }
    end

    assert_redirected_to categories_i18n_url(CategoriesI18n.last)
  end

  test "should show categories_i18n" do
    get categories_i18n_url(@categories_i18n)
    assert_response :success
  end

  test "should get edit" do
    get edit_categories_i18n_url(@categories_i18n)
    assert_response :success
  end

  test "should update categories_i18n" do
    patch categories_i18n_url(@categories_i18n), params: { categories_i18n: { category_id: @categories_i18n.category_id, description: @categories_i18n.description, description_extra: @categories_i18n.description_extra, locale: @categories_i18n.locale, name: @categories_i18n.name } }
    assert_redirected_to categories_i18n_url(@categories_i18n)
  end

  test "should destroy categories_i18n" do
    assert_difference("CategoriesI18n.count", -1) do
      delete categories_i18n_url(@categories_i18n)
    end

    assert_redirected_to categories_i18ns_url
  end
end
