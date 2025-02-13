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
    if current_user
      render json: { message: 'Logged out successfully.' }, status: :ok
    else
      render json: { message: 'No active session.' }, status: :unauthorized
    end
  end

  def current_token
    request.env['warden-jwt_auth.token']
  end

end
