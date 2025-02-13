module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private
      def find_verified_user
        user_decoder = Warden::JWTAuth::UserDecoder.new
        verified_user = user_decoder.call(session_params[:token], :user, nil) ? verified_user : reject_unauthorized_connection
      end

      def session_params
        @request.params
      end
  end
end
