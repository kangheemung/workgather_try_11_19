module PlannerSessionsHelper
    def log_in(planner)
        session[:planner_id]=planner.id
     end
     def logged_in?(planner)
        !current_planner.nil?
     end
end
