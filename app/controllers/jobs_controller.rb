class JobsController < ApplicationController
    before_action :authentication_required
    def new
        @job = Job.new
    end

    def index
        raise Job.all.inspect
    end

    def create
        @job = Job.new(params.require(:job).permit(:title, :description, :requirement, :reward))
        @job.requestor_id = current_user.id
        if @job.save
            redirect_to jobs_path
        else
            raise @job.errors.inspect
        end
    end

end
