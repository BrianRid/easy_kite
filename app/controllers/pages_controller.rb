class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @user = current_user
    @rentals = @user.rentals.order(date_start: :asc)
    @rented = @user.rentals_as_owner
    @total = @user.total
  end
end
