class Admin::UsersController < ApplicationController
    before_filter :load_user, only: [:edit, :update, :destroy]

    def index
        @users = User.all
    end

    def edit
    end

    def update
        if @user.update(permitted_params)
            redirect_to[:admin, :users]
        else
            render 'edit'
        end
    end

    def destroy
        @user.destroy!
        redirect_to[:admin, :users]
    end

    private

    def load_user
        @user = User.find(params[:id])
    end

    def permitted_params
        params.require(:user).permit(:name, :email, :role)
    end
end