class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:user_id, :email, :session_token)
  end  
  
  def new
    # default: render 'new' template
  end

  def create
   if((User.find_by user_id: params[:user][:user_id])==nil)
    @user = User.create!(user_params)
    redirect_to movies_path
   else
    flash[:notice] = "Sorry this user-id is already taken"
    redirect_to new_user_path
   end
   # puts params[:user_id]
    
 
  end
end