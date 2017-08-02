module ApplicationHelper
 def hidden_div_if(condition, attributes = {}, &block)
     if condition
         attributes["style"] = "display: none"
     end
     content_tag("div", attributes, &block)
  end
  
   def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
