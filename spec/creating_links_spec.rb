
feature "#creating_links" do
  scenario "user adds new link" do
    visit "/links/new"
    fill_in 'url',   with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    click_button 'Create link'

    expect(current_path).to eq '/links' #redirecting

    within('ul#links') do
      expect(page).to have_content 'Makers Academy'
    end
  end
end
