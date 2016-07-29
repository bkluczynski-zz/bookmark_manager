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
  expect(User.first.email_address).to eq('alice@example.com')
  end
  scenario 'cannot sign up with an already registered email address' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email address is already taken')
  end
end

feature 'User sign in' do

  let!(:user) do
    User.create(email_address: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(email_address: user.email_address,   password: user.password)
    expect(page).to have_content "Hello #{user.email_address}"
  end

  def sign_in(email_address:, password:)
    visit '/sessions/new'
    fill_in :email_address, with: email_address
    fill_in :password, with: password
    click_button 'Sign in'
  end

  feature 'Resetting Password' do
 scenario 'When I forget my password I can see a link to reset' do
   visit '/sessions/new'
   click_link 'I forgot my password'
   expect(page).to have_content("Please enter your email address")
 end
end






end
