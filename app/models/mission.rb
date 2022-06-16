class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet

  validates :name, :scientist, :planet, presence: true
  validates :scientist_id, uniqueness: { scope: :name }

  # validate :unique_missions_per_scientist

  # def unique_missions_per_scientist
  #   byebug
  #   # if expiration_date.present? && expiration_date < Date.today
  #   #   errors.add(:expiration_date, "can't be in the past")
  #   # end
  # end
end
