class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet

  validates :name, :scientist_id, :planet_id, presence: true # check that this works rather than scientist_id, etc
  validates :scientist, uniqueness: { scope: :name }
end
