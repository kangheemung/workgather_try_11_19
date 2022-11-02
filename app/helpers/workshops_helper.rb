module WorkshopsHelper
    def log_in(planner)
        session[:planner_id]=planner.id
     end
end
