module SessionHelpers

 def sign_in(email_address:, password:)
   visit '/sessions/new'
   fill_in :email_address, with: email_address
   fill_in :password, with: password
   click_button 'Sign in'
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
