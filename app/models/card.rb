class Card < ApplicationRecord
  validates :original_text, :translated_text, :review_date, presence: true
  validate :different_original_and_translated_text, on: [:create, :update]

  def different_original_and_translated_text
    if original_text.strip.casecmp(translated_text.strip).zero?
      errors.add(:translated_text, "can't original_text eq translated_text")
    end
  end

  before_validation do
    self.review_date = Date.today.next_day(3)
  end
end
