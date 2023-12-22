
#rails test test/system/login_test.rb
rails test test/system/i18n_test.rb


echo '-------------------------------------'
echo 'Results of tests:'

grep 'bin/rails test test/' log_for_all_tests.txt
grep ' failures' log_for_all_tests.txt
echo 'End! 🍻 🍻 🍻 🍻 🍻 🍻'