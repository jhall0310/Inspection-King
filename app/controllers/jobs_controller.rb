class JobsController < ApplicationController
  before_action :authenticate_admin!, :only => [:index]


  def index
    @jobs = Job.all
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


    @job = Job.new(job_params)
    @job.user_id = current_user.id
    @job.claimed = false
    if @job.save
      redirect_to user_path(current_user)
    else
      flash[:error] = job.errors.full_messages.join(", ")
    end


  end



  private
    def job_params
      params.require(:job).permit(:user_id, :resident_type, :inspection_type, :resident_name, :resident_phone_number, :address, :longitude, :latitude)
    end
end
