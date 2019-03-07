require 'rails_helper'

describe 'new club' do
  it 'ensures that the form route works with the /new action' do
    visit new_club_path
    expect(page.status_code).to eq(200)
  end

  it 'renders HTML in the /new template' do
    visit new_club_path
    expect(page).to have_content('Club Name')
  end

  it "displays a new club form that redirects to the show page, which then contains the submitted club's name and description" do
    visit new_club_path
    fill_in("club[name]", with: 'My club name')
    fill_in("club[club_category]", with: 'My club club_category')
    fill_in("club[description]", with: 'My club description')

    click_on 'Submit'

    expect(page.current_path).to eq(clubs_path)
    expect(page).to have_content('My club name')
    expect(page).to have_content('My club category')
    expect(page).to have_content('My club description')
  end

end
