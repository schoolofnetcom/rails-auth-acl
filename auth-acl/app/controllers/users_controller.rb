class UsersController < ApplicationController
    def new
        @user = User.new

        respond_to do |format|
            format.html
        end
    end

    def create
        @user = User.new(users_params)

        if @user.save
            respond_to do |format|
                format.html { redirect_to @user, notice: "User has been create" }
            end
        else
            render :action => "new"
        end
    end

    def show
        @user = User.find(params[:id])

        respond_to do |format|
            format.html
        end
    end

    private
        def users_params
            params.require(:user).permit(:name, :email, :password)
        end
end
