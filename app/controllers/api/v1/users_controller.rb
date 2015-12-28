module API::V1
  class UsersController < ApplicationController

    include RailsJwt::Authenticable

    before_action :authenticate!, only: [:show]

    # GET /users/1
    def show
      render json: @user
    end

    # POST /users
    def create

      @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created, location: api_v1_current_user_url
      else
        render json: @user.errors, status: :unprocessable_entity
      end

    end

    # # PATCH/PUT /users/1
    # def update
    #   if @user.update(user_params)
    #     render json: @user
    #   else
    #     render json: @user.errors, status: :unprocessable_entity
    #   end
    # end
    #
    # # DELETE /users/1
    # def destroy
    #   @user.destroy
    # end

    private

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:name, :email, :password)
    end

  end
end