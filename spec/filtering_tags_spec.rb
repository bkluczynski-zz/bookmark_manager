# As a time-pressed user
# So that I can quickly find links on a particular topic
# I would like to filter links by tag

feature 'links filtering' do
  scenario "so I can filter the links by tag" do
    visit '/links/new'
    fill_in 'title', with: 'Ahoj'
    fill_in 'url', with: 'http://whatever'
    fill_in 'tags', with: 'bubbles'
      click_button 'Submit'
      visit '/links/new'
      fill_in 'title', with: 'BBC'
      fill_in 'url', with: 'http://www.bbc.com'
      fill_in 'tags', with: 'stones'
        click_button 'Submit'
        visit '/tags/bubbles'
        expect(page).to have_content ('Ahoj')
        expect(page).not_to have_content ('BBC')

    end
  end
