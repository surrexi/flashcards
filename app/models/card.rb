class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validate :different_original_and_translated_text, on: [:create, :update]
  scope :expired_date, -> { where('review_date <= ?', 5.days.from_now) }

  def different_original_and_translated_text
    if original_text.strip.casecmp(translated_text.strip).zero?
      errors.add(:translated_text, 'original and translated text must be different')
    end
  end

  before_create do
    self.review_date = 3.days.from_now
  end

  def equal_origin_text?(text)
    original_text.eql?(text)
  end

  def update_review_date
    update(review_date: 3.days.from_now)
  end

  def self.rand_card
    expired_date.order('RANDOM()').first
  end
end
