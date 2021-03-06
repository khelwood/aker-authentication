module Users
  class SessionsController < Devise::SessionsController
    after_action :store_session_data, only: [:create]
    # before_action :add_email_to_user, only: [:create]
    
    skip_authorization_check if respond_to?(:skip_authorization_check)

    protected

    # def add_email_to_user
    #   request.parameters["user"]["email"] += '@sanger.ac.uk' unless request.parameters["user"]["email"].include?('@')
    # end

    def store_session_data
      session["user"] = current_user
    end

  end
end