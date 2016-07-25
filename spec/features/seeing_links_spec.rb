feature 'seeing a list of links' do
  scenario 'allows to see a list of links' do
    visit '/links'
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    find_link('My Link').visible?

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content ('Makers Academy')
    end
  end
end




# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage
