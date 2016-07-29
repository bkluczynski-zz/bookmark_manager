require 'data_mapper'

feature 'SIGN UP' do

scenario 'signing up' do
  visit ('/sign_up')
  fill_in "email_address", with: "hulkhogan@gmail.com"
  fill_in "password", with: "imsosexy"
  fill_in "password_confirmation", with: "imsosexy"
  click_button "Sign up"
   expect(page).to have_content "Hello hulkhogan@gmail.com!"
 end

scenario 'increasing the quantity of users by one' do
  expect { sign_up }.to change(User,:count).by(1)
  expect(User.first.email_address).to eq('hulkhogan@gmail.com')
end




end
