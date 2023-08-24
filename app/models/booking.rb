class Booking < ApplicationRecord
  STATUS = %w[Pending Confirmed]

  belongs_to :user
  belongs_to :dragon

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  validates :user, presence: true
  validates :status, presence: true, inclusion: { in: STATUS }
  validates :duration, numericality: { greater_than: 0 }

  private

  def end_date_after_start_date
    if start_date.present? && end_date.present? && end_date < start_date
      errors.add(:end_date, "the end date should be greater or equal to the start date")
    end
  end
end
