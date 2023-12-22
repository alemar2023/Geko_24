require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase

  test "i18n start test" do
    page.windows[0].maximize
    puts "1 alex"
    visit alex_link_path
    assert_text 'Nasce'
  end

  test "user sees content in different languages" do

    puts "entro e setto locale EN"

    visit root_path
    click_link  'Language'
    click_link "eng"
    assert_selector "h3", text: "Welcome"
    puts "cambio e setto locale ES"


    click_link  'Language'
    click_link "esp"
    assert_selector "h3", text: "Bienvenida"
    puts "creo utente ugo con locale EN"

    user = User.create!(
      email: 'ugo@mail.com',
      password: 'Password1!',
      password_confirmation: 'Password1!',
      confirmed_at: Date.current,
      locale: 'en')
    sleep 1
    visit new_user_session_url

    fill_in 'login_email', with:'ugo@mail.com'
    fill_in 'login_password', with: 'Password1!'
    click_button 'login_submit'

    assert_text 'Signed in successfully.'
    visit root_path
    assert_selector "h3", text: "Welcome"

    puts "cambio e setto locale DE (utente registrato)"
    click_link  'Language'
    click_link "deu"
    assert_selector "h3", text: "Willkommen"
    visit alex_link_path
    sleep 1
    assert_text 'Nasce'
    sleep 1
    visit root_path
    sleep 1
    assert_selector "h3", text: "Willkommen"

  end


  test "user logged  in different languages" do

    visit root_path
    click_link  'Language'
    click_link "esp"
    sleep 1
    assert_selector "h3", text: "Bienvenida"
    sleep 1
    puts "alex_2"
    click_link  'Language'
    click_link "deu"
    assert_selector "h3", text: "Willkommen"
    sleep 1
    visit alex_link_path
    sleep 1
    assert_text 'Nasce'
    sleep 1
    visit root_path
    sleep 1
    assert_selector "h3", text: "Willkommen"

  end
end



