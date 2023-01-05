module Planners::ScheculesHelper
   
      def current_planner
        @current_planner||= Planner.find_by(id: session[:planner_id])
      end
end
