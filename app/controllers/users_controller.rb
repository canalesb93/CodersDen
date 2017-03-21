class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @online_judges = @user.online_judges
  end

end
