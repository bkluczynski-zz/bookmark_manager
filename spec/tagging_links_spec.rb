DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")


feature 'tagging' do
  scenario "so I can tag the link" do
    visit '/links/new'
    fill_in 'title', with: 'BBC'
    fill_in 'url', with: 'http://www.bbc.com'
    fill_in 'tag', with: 'BBC-TAG'
    click_button 'Submit'

    within 'ul#links' do
      expect(page).to have_content('New Tag')
    end
  end
end

#
# As a time-pressed user
# So that I can organise my many links into different categories for ease of search
# I would like to tag links in my bookmark manager
