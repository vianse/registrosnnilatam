class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        #admin_path(current_admin) #your path
        events_path
      end
end
