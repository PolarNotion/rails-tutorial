class Donation < ApplicationRecord
  scope :high_value, -> { where('amount_in_cents >= ?', 10000) }
  scope :recent, -> { where('created_at > ?', 30.days.ago) }
  
  validates :amount_in_cents, presence: true
  
  before_save :_ensure_stripe_charge_id
  
  def amount_in_dollars
    amount_in_cents / 100
  end
  
  def transaction_amount_in_dollars
    amount_in_dollars * 0.03
  end
  
  # Class Methods
  
  def self.gross_amount_in_dollars
    self.sum(:amount_in_cents) / 100
  end
  
  private
  
  def _ensure_stripe_charge_id
    unless stripe_charge_id.present?
      self.stripe_charge_id = SecureRandom.hex(6)
    end
  end
  
end
