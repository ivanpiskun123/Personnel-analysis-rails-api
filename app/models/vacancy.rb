class Vacancy < ApplicationRecord

  scope :opened, -> { where(status: false) }
  scope :closed, -> { where(status: true) }

  # status true = closed, false = opened

  belongs_to :position
  has_many :candidates

  def status_name
    status ? "Закрыта" : "Открыта"
  end

  def to_s
    "Вакансия №#{id}: #{position.name}"
  end

end
