class UserSerializer
  def initialize(user)
    @user = user
  end
  def as_json
    {
      id: @user.id,
      email: @user.email,
      created_at: @user.created_at,
      updated_at: @user.updated_at
    }
  end
end