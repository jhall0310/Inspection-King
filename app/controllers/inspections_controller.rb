class InspectionsController < ApplicationController
  before_action :authenticate_admin!, :only => [:index]

  def index
  end

  def show
    @inspection = Inspection.find_by_id(params[:id])
    @job = @inspection.job
  end

  def new
    @admin = current_admin
    p @admin
    @job = Job.find_by_id(params[:job_id])
    @inspection = Inspection.new
    @inspection.job = Job.find_by_id(params[:job_id])

    @inspection.user_id = @inspection.job.user_id
    @inspection.pending = true
    @inspection.approved = false
    @inspection.admin = current_admin




    @inspection.save
      if @inspection.save
        @job.update_attributes(claimed: true)
        flash[:notice] = "You have claimed this inspection."
      else
        flash[:error] = @inspection.errors.full_messages.join(", ")
      end
      redirect_to admins_show_path
    end


    def approve
      @inspection = Inspection.find_by_id(params[:id])
      @inspection.update_attributes(approved: true, pending: false)

    if @inspection.save
      flash[:notice] = "You have approved this inspection."

      redirect_to admin_path(current_admin)
    end
  end

  def destroy
  end
end
