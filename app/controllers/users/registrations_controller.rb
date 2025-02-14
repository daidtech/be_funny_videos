class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  before_action :authenticate_user!, only: [:update, :destroy]
  before_action :authenticate_admin!, only: [:update, :destroy]

  # POST /resource
  def create
    super
  end


  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  private

  def authenticate_admin!
    unless current_user.admin?
      render json: { status: { code: 403, message: 'Forbidden: Admins only.' } }, status: :forbidden
    end
  end

  private

  def respond_with(current_user, _opts = {})
    if resource.persisted?
      render json: {
        status: {code: 200, message: 'Signed up successfully.'},
        data: UserSerializer.new(current_user).as_json
      }
    else
      render json: {
        status: { error: "#{current_user.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
  end
end