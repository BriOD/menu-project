module ApplicationHelper
  def authorize(erb)
     if current_user && current_user.admin?
       erb
     end
  end  
end
