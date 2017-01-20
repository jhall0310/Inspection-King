class JobsController < ApplicationController
  before_action :authenticate_admin!, :only => [:index]


  def index
    @jobs = Job.all

    @hash = Gmaps4rails.build_markers(@jobs) do |job, marker|

      marker.lat job.latitude
      marker.lng job.longitude
      marker.infowindow job.address
    end
  end

  def show
    @job = Job.find_by_id(params[:id])

  end

  def new
    @user = User.find(session[:user_id])
    @job = Job.new
    p @user
  end

  def create

    @user = current_user
    @job = Job.new(job_params)
    @job.user_id = current_user.id
    @job.claimed = false
    if @job.save
      UserMailer.job_created(@user, @job).deliver_now
      flash[:notice] = "You have successfully scheduled this inspection."
      redirect_to user_path(current_user)
    else
      flash[:error] = job.errors.full_messages.join(", ")
    end
  end

  def edit
    @user = current_user
    @job = Job.find_by_id(params[:id])
  end

  def update
    user = current_user
    job_id = params[:id]
    job = Job.find_by(id: job_id)
   if job.update(job_params)
     flash[:notice] = "You have successfully updated this Job."
     redirect_to user_path(user)
   else
     redirect_to edit_user_job_path(user, job)
   end
  end


  private
    def job_params
      params.require(:job).permit(:user_id, :resident_type, :inspection_type, :resident_name, :resident_phone_number, :address, :longitude, :latitude)
    end
end
