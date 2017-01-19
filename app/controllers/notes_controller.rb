class NotesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @note = Note.new
    job_id = params[:job_id]
    @job = Job.find_by(id: job_id)
    p @job
  end

  def create
    job_id = params[:job_id]
    @job = Job.find_by(id: job_id)
    new_note = Note.new(note_params)
    @user = @job.user
    print @user
    if new_note.save
     @job.notes << new_note
     redirect_to admin_path(current_admin)

      else
        flash[:error] = new_note.errors.full_messages.join(", ")
        redirect_to admin_path(current_admin)
      end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def note_params
      params.require(:note).permit(:title, :instruction)
    end

end
