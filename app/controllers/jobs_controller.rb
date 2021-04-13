class JobsController < ApplicationController
    before_action :authentication_required
    def new
        @job = Job.new
    end

    def index
        @jobs = Job.all
    end

    def show
        @job = Job.find(params[:id])
        @acceptance = Acceptance.find_by(job_response_id: @job.id, responder_id: @current_user.id)
    end

    def update
        @job = Job.find(params[:id])
        @current_user.job_responses << @job
        @job.responder_users << @current_user
        if @job.save
            redirect_to jobs_path
        else
            render :show
        end
    end


    def create
        @job = Job.new(params.require(:job).permit(:title, :description, :requirement, :reward))
        @job.requestor_user_id = current_user.id
        if @job.valid?
            @job.save
            redirect_to job_path(@job)
        else
            render :new
        end
    end

end
