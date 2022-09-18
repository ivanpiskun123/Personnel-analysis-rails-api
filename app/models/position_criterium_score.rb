class PositionCriteriumScore < ApplicationRecord

  belongs_to :position
  belongs_to :criterium

  validates :score, inclusion: { in: 1..5 ,
               message: "(%{value}) can't be less 1 and more 5" }

  validates :score, presence: true
end
