class UsersController < ApplicationController
  layout 'application'

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        # Send mail with user information for lead followup
        @user.send_lead
        # Redirect to a thanks page
        format.html { redirect_to user_path(@user) }
      else
        format.html { render :new }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :house_description, :art_style, :phone_number, :availability)
  end
end
