

# then, whenever you need to clean the DB

feature 'creating links' do
  scenario "so I can save the link" do
    visit '/links/new'
    fill_in 'title', with: 'BBC'
    fill_in 'url', with: 'http://www.bbc.com'
    click_button 'Submit'

      expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('BBC')
    end
  end
end
