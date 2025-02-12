class Users::SessionsController < Devise::SessionsController
  respond_to :json

  protected
  def respond_with(current_user, _opts = {})
    render json: {
      token: current_token,
      message: 'Logged in successfully.'
    }, status: :ok
  end

  def respond_to_on_destroy
    jwt_payload = current_token
    jti = JWT.decode(
      jwt_payload,
      Rails.application.credentials.devise_jwt_secret_key || ENV['DEVISE_JWT_SECRET_KEY'],
      true, algorithm: 'HS256'
      )[0]['jti']
    if current_user
      JwtDenylist.create!(jti: jti, exp: Time.at(JWT.decode(jwt_payload, nil, false)[0]['exp']))
      render json: { message: 'Logged out successfully.' }, status: :ok
    else
      render json: { message: 'No active session.' }, status: :unauthorized
    end
  end

  def current_token
    request.env['warden-jwt_auth.token']
  end

end
