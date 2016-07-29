def sign_up
  visit '/sign_up'
  expect(page.status_code).to eq(200)
  fill_in :email_address, with: 'hulkhogan@gmail.com'
  fill_in :password, with: 'wrestling!'
  fill_in :password_confirmation, with: 'wrestling!'
  click_button 'Sign up'
end
