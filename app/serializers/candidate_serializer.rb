class CandidateSerializer
  include JSONAPI::Serializer

  attributes :first_name, :second_name, :email, :number,
             :expirience_years, :biography,
             :created_at, :status,  :gender

  attribute :avatar do |object|
    "#{Rails.application.routes.url_helpers.rails_blob_path(object.avatar) if object.avatar.attached?}"
  end

  belongs_to :vacancy
  belongs_to :user


end
