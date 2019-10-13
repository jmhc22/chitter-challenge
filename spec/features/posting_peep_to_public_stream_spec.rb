feature 'Posting peep' do
  scenario 'displays posted peep on public stream' do
    visit '/'
    fill_in('new_peep', with: 'this is a test peep')
    click_button 'Post'

    expect(page).to have_content 'this is a test peep'
  end

  context 'displays peeps in reverse chronological order' do
    scenario 'displays the second peep posted at the top' do
      visit '/'
      fill_in('new_peep', with: 'this is a test peep')
      click_button 'Post'
      fill_in('new_peep', with: 'this is another test peep')
      click_button 'Post'

      expect(first('.peep')).to have_content 'another'
    end
  end
end
