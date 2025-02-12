# lib/custom_failure_app.rb
class CustomFailureApp < Devise::FailureApp
  def http_auth_body
    {
      sucess: false,
      error: i18n_message
    }.to_json
  end

  def i18n_message
    I18n.t("devise.failure.#{warden_message}", default: :invalid)
  end
end
