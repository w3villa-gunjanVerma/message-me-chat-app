class SessionsController < ApplicationController
    def new
    end
    def create
       @user = User.find_by(username: params[:session][:username])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            flash.now[:notice] = "you are sussfully login"
            redirect_to root_path
        else
            flash.now[:notice] = "please, provide correct username and password"
            render 'new' , status: 422
        end
    end
    def destroy
        session[:user_id] = nil
        flash.now[:notice] = "you have successfully logged out"
        redirect_to login_path
    end
end
