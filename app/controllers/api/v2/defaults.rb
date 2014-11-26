module API
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        prefix "api"
        version "v2", using: :path
        default_format :json
        format :json
        formatter :json, Grape::Formatter::ActiveModelSerializers

        helpers do
          def permitted_params
            @permitted_params ||= declared(params, include_missing: false)
          end

          def logger
            Rails.logger
          end

          def authenticate!
            error!('Unauthorized. Invalid or expired token.', 401) unless current_user
          end

          def current_user
            token = request.headers["Authorization"]
            if token
              User.find_by(auth_token: token)
            else
              false
            end
          end
        end

        rescue_from ActiveRecord::RecordNotFound do |e|
          error_response(message: e.message, status: 404)
        end

        #rescue_from ActiveRecord::RecordInvalid do |e|
        #  error_response(message: e.message, status: 422)
        #end
      end
    end
  end
end