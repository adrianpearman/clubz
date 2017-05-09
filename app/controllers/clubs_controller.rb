class ClubsController < ApplicationController
  before_action :require_login, only: [:show]
  before_action :authorize, only: [:show]

  def index
    @clubs = Club.all
  end

  def show
    @club = Club.find(params[:id])
  end

  private

  def require_login
    redirect_to new_session_path unless current_user
  end

  def authorize
    redirect_to root_path unless  User::ALLOWED_ROLES.include?(current_user.role)
  end
end
