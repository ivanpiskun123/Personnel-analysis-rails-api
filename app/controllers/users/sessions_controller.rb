# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json
  skip_before_action :authenticate_user!

  # POST /resource/sign_in
  def create

    user = User.find_by_email(params[:user][:email])

    if user && user.valid_password?(params[:user][:password])
      token = user.generate_jwt
      render json:
               {
                 token:  token.to_json,
                 user_id: user.id
               }
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end

  end
end
