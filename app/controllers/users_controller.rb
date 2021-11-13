class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end
    end

    def show
        if helpers.current_user == User.find(params[:id])
                @user = User.find(params[:id])
        else redirect_to login_path
        end
    end

    def edit

    end
  
    def update
      @user.update(user_params)
  
      redirect_to user_path(@user)
    end
   
    def destroy
      @user = User.find(params[:id])
      @user.destroy
  
      redirect_to root_path
    end

    private
    
    def user_params
        params.require(:user).permit(:username, :password)
    end

end