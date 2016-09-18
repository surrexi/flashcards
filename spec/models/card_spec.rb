require "rails_helper"

describe Card do
  describe '.equal_origin_text?' do
    card = Card.create!(original_text: 'hello', translated_text: 'привет')
    it 'correct origin text' do
      expect(card.equal_origin_text?('hello')).to be true
    end

    it 'wrong origin text (1)' do
      expect(card.equal_origin_text?('    hello')).to be false
    end

    it 'wrong origin text (2)' do
      expect(card.equal_origin_text?('Hello')).to be false
    end

    it 'wrong origin text (3)' do
      expect(card.equal_origin_text?('hello2')).to be false
    end
  end
end
