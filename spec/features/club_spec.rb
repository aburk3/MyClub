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
    fill_in

end
