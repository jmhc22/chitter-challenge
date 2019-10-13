feature 'Posting peep' do
  scenario 'displays posted peep on public stream' do
    visit '/'
    fill_in('new_peep', with: 'this is a test peep')
    click_button 'Post'

    expect(page).to have_content 'this is a test peep'
  end
end
