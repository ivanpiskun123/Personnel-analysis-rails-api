class CandidateSerializer
  include JSONAPI::Serializer

  attributes :first_name, :second_name, :email, :number,
             :expirience_years, :biography, :vacancy_id,
             :created_at, :status, :user_id, :gender

end
