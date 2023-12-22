require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase


  test "successful access to my account page" do
    page.windows[0].maximize
    user = User.create!(
                        email: 'ugo@mail.com',
                        password: 'Password1!',
                        password_confirmation: 'Password1!',
                        confirmed_at: Date.current,
                        locale: 'en')
    visit new_user_session_url

    # login into session
    fill_in 'login_email', with:'ugo@mail.com'
    fill_in 'login_password', with: 'Password1!'
    click_button 'login_submit'

    assert_text 'Signed in successfully.'

    # logout from session
    click_link  'dropdown_btn'

    click_link 'logout_user'

    page.driver.browser.switch_to.alert.accept
    sleep 1
    assert_text 'Signed out successfully.'

    # Navigo sulla pagina di edit delle informazioni associate al profilo dell'utente
    click_link  'login_menu_btn'
    fill_in 'login_email', with:'ugo@mail.com'
    fill_in 'login_password', with: 'Password1!'
    sleep 1
    click_button 'login_submit'
    sleep 1

    click_link  'dropdown_btn'
    find_by_id('user_edit_page_link').click
    email = find '#user_edit_email'

    sleep 1
    assert_equal('ugo@mail.com', email.value)


    fill_in 'user_edit_email', with: 'ugo@libero.it'
    fill_in 'user_current_password', with: 'Password1!'

    password = find '#user_current_password'

    assert_equal('Password1!', password.value)

    click_button 'user_update_btn'
    sleep 1
     assert_text 'You updated your account successfully, but we need to verify your new email address. Please check your email and follow the confirmation link to confirm your new email address.'
    sleep 1

    # Tento di modificare la password specificando però la vecchia password ma non la nuova
    click_link  'dropdown_btn'
    find_by_id('user_edit_page_link').click
    fill_in 'user_current_password', with: 'Password1!'
    click_button 'user_update_btn'
    assert_text 'Your account has been updated successfully.'

    # Tento di modificare la password specificando la vecchia password corretta e inserendo 2 nuove password  diverse fra loro
    click_link  'dropdown_btn'
    find_by_id('user_edit_page_link').click
    fill_in 'user_new_password', with: 'Password2!'
    fill_in 'user_new_confirmation_password', with: 'Password3!'
    fill_in 'user_current_password', with: 'Password1!'
    click_button 'user_update_btn'
    assert_text 'Password confirmation doesn\'t match Password'

    # Tento di modificare la password specificando la vecchia password sbagliata e inserendo 2 nuove password  uguali fra loro
    click_link  'dropdown_btn'
    find_by_id('user_edit_page_link').click
    fill_in 'user_new_password', with: 'Password2!'
    fill_in 'user_new_confirmation_password', with: 'Password2!'
    fill_in 'user_current_password', with: 'Password_Wrong'
    click_button 'user_update_btn'
    assert_text 'Current password is invalid'

    # Ora testo il salvataggio vero e proprio di una nuova password aggiornata valida
    click_link  'dropdown_btn'
    find_by_id('user_edit_page_link').click
    fill_in 'user_new_password', with: 'Password2!'
    fill_in 'user_new_confirmation_password', with: 'Password2!'
    fill_in 'user_current_password', with: 'Password1!'
    click_button 'user_update_btn'
    assert_text 'Your account has been updated successfully.'

    # Ora testo ceh il cliente decide di cancellarsi
    click_link  'dropdown_btn'
    find_by_id('user_edit_page_link').click
    click_button 'destroy_user_btn'
    page.driver.browser.switch_to.alert.accept
    assert_text 'Bye! Your account has been successfully cancelled. We hope to see you again soon.'
  end


  test "wrong login to access  my account page" do
    page.windows[0].maximize
    user = User.create!(
                        email: 'ugo@mail.com',
                        password: 'Password1!',
                        password_confirmation: 'Password1!',
                        confirmed_at: Date.current,
                        locale: 'en')
    visit new_user_session_url

    # login con password sbagliata
    fill_in 'login_email', with:'ugo@mail.com'
    fill_in 'login_password', with: 'assword1!'
    click_button 'login_submit'
    sleep 1
    assert_text 'Invalid Email or password.'
  end

  test "test registration new user" do
    page.windows[0].maximize
    user = User.create!(
      email: 'ugox@mail.com',
      password: 'Password1!x',
      password_confirmation: 'Password1!x',
      confirmed_at: Date.current,
      locale: 'en')
    visit new_user_session_url

    # registrazione con email sbagliata
    click_link  'register_btn'
    fill_in 'registration_form_email', with:'ugo@mail.com'
    fill_in 'registration_form_password', with: 'Password!'
    fill_in 'registration_form_password_confirmation', with: 'Password1!'
    click_button 'registration_form_submit'
    sleep 1
    assert_text 'Password confirmation doesn\'t match Password'
    sleep 1
    fill_in 'registration_form_email', with:'ugo@mail.com'
    fill_in 'registration_form_password', with: 'Password1!'
    fill_in 'registration_form_password_confirmation', with: 'Password1!'
    click_button 'registration_form_submit'
    sleep 1
    assert_text 'A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.'
  end
end
