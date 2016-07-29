feature 'user signs up' do
  scenario 'user sign up with mismatching password' do
    expect { sign_up(password_confirmation: 'wrong') }.to_not change(User,:count)
  end

  def sign_up(email_address: 'alice@example.com',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/sign_up'
    fill_in :email_address, with: email_address
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

end
