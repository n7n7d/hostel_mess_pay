class LeavesController < ApplicationController

  def new
       @leave=Leave.new
  end

   def show
     @leaves = current_user.resident.leaves
   end

  def create
    @leave=current_user.resident.leaves.new(leave_params)
    if @leave.save
      flash[:info] = "Leave successfully marked"
      redirect_to leaves_path
    else
      flash[:danger]= @leave.errors.full_messages.first
      redirect_to new_leave_path
    end
  end

  private

  def leave_params
    params.require(:leave).permit(:start_date,:end_date,:destination)
  end

end