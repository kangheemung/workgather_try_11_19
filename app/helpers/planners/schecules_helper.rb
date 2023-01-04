module Planners::ScheculesHelper
    def current_workshop
        @current_workshop||= Workshop.find_by(id: session[:workshop_id])
      end
end
