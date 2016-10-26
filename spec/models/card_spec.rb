require "rails_helper"

describe Card do
  describe '.equal_origin_text?' do
    card = Card.create!(original_text: 'hello', translated_text: 'привет')
    it 'correct origin text (1)' do
      expect(card.check_translate?('hello')).to be true
    end

    it 'correct origin text (2)' do
      expect(card.check_translate?('    hello')).to be true
    end

    it 'correct origin text (3)' do
      expect(card.check_translate?('Hello')).to be true
    end

    it 'wrong origin text' do
      expect(card.check_translate?('hello2')).to be false
    end
  end
end
