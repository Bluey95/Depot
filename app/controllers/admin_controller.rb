class AdminController < ApplicationController
  def index
    @total_orders = Order.count
    @users = User.all
    @total_schedules = Schedule.count
  end
end
