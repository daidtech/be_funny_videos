class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, only: [:update]
  respond_to :json

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

  def respond_with(current_user, _opts = {})
    if resource.persisted?
      render json: {
        status: {code: 200, message: 'Signed up successfully.'},
        data: UserSerializer.new(current_user).as_json
      }
    else
      render json: {
        status: { error: "Không thể tạo người dùng thành công. #{current_user.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
  end
end