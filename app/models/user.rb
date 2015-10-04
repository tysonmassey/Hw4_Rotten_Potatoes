class User < ActiveRecord::Base
    def User::create_user! hash
        #id=hash[:user][:user_id]
        #email=hash[:user][:email]
        current_sess=SecureRandom.base64 
        new_hash=hash.require(:user).permit(:user_id, :email).merge(session_token: current_sess)
        @user=User.create!(new_hash)

    end
end
