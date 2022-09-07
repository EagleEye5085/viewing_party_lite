require 'rails_helper'

describe 'Create a New User' do
  before :each do
    @user = User.create!(name: 'tom', email: 'tom@bite.com', password: "password123")
    visit new_user_path
  end

  it "should be able to create a new user" do

    expect(page).to have_content("Register A New User")

    fill_in :name, with: 'Dave'
    fill_in :email, with: 'daveisnotdave32@gmail.com'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password123'

    click_button 'Create New User'

    expect(current_path).to eq user_path(User.last.id)
  end
  it "must have uniq email" do

    expect(page).to have_content("Register A New User")

    fill_in :name, with: 'Dave'
    fill_in :email, with: 'tom@tom.com'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password123'

    click_button 'Create New User'

    expect(current_path).to eq new_user_path
    expect(page).to have_content("Email has already been taken")

  end

  it "must have a name" do

    expect(page).to have_content("Register A New User")

    fill_in :email, with: 'dave@gmail.com'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password123'

    click_button 'Create New User'

    expect(current_path).to eq new_user_path
    expect(page).to have_content("Name can't be blank")

  end

  it "must have a email" do

    expect(page).to have_content("Register A New User")

    fill_in :name, with: 'Dave'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password123'

    click_button 'Create New User'

    expect(current_path).to eq new_user_path
    expect(page).to have_content("Email can't be blank")

  end

  it 'must have matching passwords' do

    expect(page).to have_content("Register A New User")

    fill_in :name, with: 'Dave'
    fill_in :email, with: 'daveisnotdave32@gmail.com'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password456'

    click_button 'Create New User'

    expect(current_path).to eq new_user_path
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
