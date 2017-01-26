class InspectionsController < ApplicationController
  before_action :authenticate_admin!, :only => [:index]

  def index
    @inspections = Inspection.all
    @hash = Gmaps4rails.build_markers(@inspections) do |inspection, marker|
      marker.lat inspection.job.latitude
      marker.lng inspection.job.longitude
      marker.infowindow inspection.job.address
    end
  end

  def history
    @inspections = Inspection.all
    if params[:search]
    @inspections = Inspection.search(params[:search]).order("created_at DESC")
  else
    @inspections = Inspection.all.order('created_at DESC')
  end
end

  def show
    @inspection = Inspection.find_by_id(params[:id])
    @job = @inspection.job
    @hash = Gmaps4rails.build_markers(@inspection) do |inspection, marker|

      marker.lat inspection.job.latitude
      marker.lng inspection.job.longitude
      marker.infowindow inspection.job.address
    end
  end

  def new
    @admin = current_admin
    p @admin
    @job = Job.find_by_id(params[:job_id])
    @user = @job.user
    @inspection = Inspection.new
    @inspection.job = Job.find_by_id(params[:job_id])

    @inspection.user_id = @inspection.job.user_id
    @inspection.pending = true
    @inspection.approved = false
    @inspection.admin = current_admin




    @inspection.save


      if @inspection.save
        UserMailer.job_claimed(@user, @job, @admin).deliver_now
        @job.update_attributes(claimed: true)
        flash[:notice] = "You have claimed this inspection."
      else
        flash[:error] = @inspection.errors.full_messages.join(", ")
      end
      redirect_to admins_show_path
    end


    def approve
      @admin = current_admin
      @inspection = Inspection.find_by_id(params[:id])
      @user = @inspection.user
      @job = @inspection.job
      @inspection.update_attributes(approved: true, pending: false)

    if @inspection.save
      UserMailer.job_approved(@user, @job, @admin).deliver_now
      flash[:notice] = "You have approved this inspection."

      redirect_to admin_path(current_admin)
    end
  end

#you can remove unused methods like this :)
  def destroy
  end

  def inspection_params
  params.require(:inspection).permit(:pending, :approved, :updates, :term)
  end

end
