class VacancySerializer
  include JSONAPI::Serializer

  attributes :status, :opening_date, :closing_date

  belongs_to :position

end
