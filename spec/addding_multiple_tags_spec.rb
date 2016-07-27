feature 'adding multiple tags' do
  scenario 'so I can tag the link many times' do
    visit '/links/new'
    fill_in 'title', with: 'BBC'
    fill_in 'url', with: 'http://www.bbc.com'
    fill_in 'tags', with: 'mission education public_money'
    click_button 'Submit'
    link = Link.first

    expect(link.tags.map(&:name)).to include('mission', 'education', 'public_money')

    end
  end
