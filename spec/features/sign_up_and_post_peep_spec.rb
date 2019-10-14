feature 'Signing up for chitter' do
  scenario "displays peep with user's name and handle" do
    visit '/'
    click_button 'Sign Up'
    expect(current_path).to eq '/sign-up'

    fill_in('name', with: 'James Clark')
    fill_in('handle', with: 'JC293')
    fill_in('email', with: 'test@testemail.com')
    fill_in('password', with: 'password123')
    click_button 'Submit'

    expect(current_path).to eq '/'
    fill_in('new_peep', with: 'this is a test peep')
    click_button 'Post'

    expect(first('.peep')).to have_content 'James Clark'
    expect(first('.peep')).to have_content 'JC293'
  end
end
