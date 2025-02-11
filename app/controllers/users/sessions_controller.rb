class Users::SessionsController < Devise::SessionsController
  respond_to :json

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    render json: {
      token: current_token,
      user: UserSerializer.new(resource).as_json,
      message: 'Logged in successfully.'
    }, status: :ok
  rescue StandardError => error
    render json: {
      error: error
    }, status: :unauthorized
  end

  # DELETE /resource/sign_out
  def destroy
    sign_out(resource_name)
    render json: { message: 'Logged out successfully.' }, status: :ok
  end

  protected
  def respond_with(current_user, _opts = {})
    current_user.check_active_sessions
    render json: {
      token: current_token,
      message: 'Logged in successfully.'
    }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: 'Logged out successfully.'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end

  def current_token
    request.env['warden-jwt_auth.token']
  end

end
