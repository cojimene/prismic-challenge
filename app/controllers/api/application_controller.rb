module Api
  class ApplicationController < ActionController::API
    TOKEN = Rails.application.credentials.prismic_api_key

    before_action :restrict_access

    protected

    def restrict_access
      auth_token = "Basic #{Base64.strict_encode64('Auth:' + TOKEN)}"

      if request.headers['Authorization'] != auth_token
        render json: 'You are not authorized to make this request', status: :unauthorized
      end
    end
  end
end
