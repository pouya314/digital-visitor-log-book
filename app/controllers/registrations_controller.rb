class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      logger.debug "====================== I was called!!!!!! ======================"
      admin_visits_path
    end
end
