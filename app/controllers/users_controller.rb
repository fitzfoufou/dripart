class UsersController < ApplicationController
  layout 'application'

  def new
    @user = User.new
  end
end
