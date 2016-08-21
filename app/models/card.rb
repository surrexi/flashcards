class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validate :different_original_and_translated_text, on: [:create, :update]

  def different_original_and_translated_text
    if original_text.strip.casecmp(translated_text.strip).zero?
      errors.add(:translated_text, 'original and translated text must be different')
    end
  end

  before_create do
    self.review_date = 3.days.from_now
  end
end
