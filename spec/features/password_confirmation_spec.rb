feature 'user signs up' do
  scenario 'user sign up with mismatching password' do
    expect { sign_up(password_confirmation: 'wrong') }.to_not change(User,:count)
    expect(current_path).to eq('/sign_up')
    expect(page).to have_content "Password and confirmation password do not match"
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

  scenario 'cannot sign up without an email' do
    expect { sign_up(email_address: nil) }.not_to change(User, :count)
  end

  scenario ' cannot sign_up with invalid email' do
    expect { sign_up(email_address: "invalid@email") }.not_to change(User, :count)
  end

end
