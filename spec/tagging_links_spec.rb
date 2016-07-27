

feature 'tagging' do
  scenario "so I can tag the link" do
    visit '/links/new'
    fill_in 'title', with: 'BBC'
    fill_in 'url', with: 'http://www.bbc.com'
    fill_in 'tags', with: 'mission'

    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:name)).to include('mission')
    end
  end


#
# As a time-pressed user
# So that I can organise my many links into different categories for ease of search
# I would like to tag links in my bookmark manager
