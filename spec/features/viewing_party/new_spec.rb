require 'rails_helper'

RSpec.describe 'new viewing party page' do

  it 'can not be viewed if not logged in' do

    visit "/discover"

    click_button 'Top Rated Movies'

    click_link 'The Shawshank Redemption'

    click_button 'Create a viewing party'

    expect(current_path).to eq root_path
    expect(page).to have_content("Sorry, you must be logged in.")
  end

  it 'can see the title of the movie', :vcr do
    user1 = User.create!(name: 'tom', email: 'tom.gmail.com', password: "password123")
    user2 = User.create!(name: 'wes', email: 'wes.gmail.com', password: "password123")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user2)

    visit "/discover"

    click_button 'Top Rated Movies'

    click_link 'The Shawshank Redemption'

    click_button 'Create a viewing party'
    expect(page).to have_content("Create a Viewing Party for: The Shawshank Redemption")
  end

  it "is able to tell the information for the viewing party" do
    user1 = User.create!(name: 'tom', email: 'tom.gmail.com', password: "password123")
    user2 = User.create!(name: 'wes', email: 'wes.gmail.com', password: "password123")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user2)

    visit "/discover"

    click_button 'Top Rated Movies'

    click_link 'The Shawshank Redemption'

    click_button 'Create a viewing party'
    expect(page).to have_content("Duration of party")
    expect(page).to have_content("Date")
    expect(page).to have_content("Start time")
  end

end
