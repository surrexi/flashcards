require 'rails_helper'

describe 'Work with cards,', type: :feature do
  let!(:card) { create(:card) }
  let!(:card2) { create(:card) }

  context 'check cards:' do
    before(:each) do
      Card.update_all review_date: Date.today
      visit root_path
    end

    it 'enter the correct translation' do
      fill_in 'card_original_text', with: card.original_text
      click_button 'Check card'

      expect(page).to have_text('Correctly!')
    end

    it 'enter the incorrect translation' do
      fill_in 'card_original_text', with: 'developer'
      click_button 'Check card'

      expect(page).to have_text("Wrong! Correct answer: '#{card.original_text}'. Try again.")
    end
  end
end
