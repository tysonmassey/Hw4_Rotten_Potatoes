class SessionsController < ApplicationController
    
    def new
    
    end
    
    def create
        
        current_id=params[:user][:user_id]
        current_email=params[:user][:email]
        current_user=User.find_by user_id: current_id
        if(current_user==nil)
            flash[:notice] = "Incorrect username or password"
            redirect_to login_path
        elsif(current_user.user_id==current_id&&current_user.email==current_email&&current_user!=nil)
            session[:session_token] = current_user.session_token
            #flash[:notice] = "You are now logged in as #{current_user.user_id}"
            redirect_to movies_path
        else
            flash[:notice] = "Incorrect username or password"
            redirect_to login_path
        end
    end
    
    def destroy
        @current_user = session[:session_token] = nil
        redirect_to movies_path
    end

end