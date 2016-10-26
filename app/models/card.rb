class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validate :different_original_and_translated_text, on: [:create, :update]
  scope :expired_date, -> { where('review_date <= ?', 1.days.from_now) }

  def different_original_and_translated_text
    errors.add(:translated_text, 'original and translated text must be different') if check_translate?(translated_text)
  end

  before_create do
    self.review_date = 3.days.from_now
  end

  def check_translate?(text)
    original_text.strip.casecmp(text.strip).zero?
  end

  def update_review_date
    update(review_date: 3.days.from_now)
  end

  def self.rand_card
    expired_date.order('RANDOM()').first
  end
end
