class Users::CurrentUserController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: UserSerializer.new(current_user).as_json
  end
end