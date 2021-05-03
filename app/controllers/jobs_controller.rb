class JobsController < ApplicationController
    before_action :authentication_required
    def new
        @job = Job.new
        render :layout => 'job'
    end

    def index
        if params[:format]
            @jobs = Job.where(requirement: params[:format])
        elsif params[:id]
            sort_by_user
        else
            @jobs = Job.all
        end
        find_powered_heroization
        render :layout => 'job'
    end

    def create
        @job = Job.new(required_params)
        @job.requestor_user_id = current_user.id
        if @job.valid?
            update_civilian_rank
            current_user.save
            @job.save
            redirect_to job_path(@job)
            return
        else
            render :new, :layout => 'job'
        end
    end

    def show
        @job = Job.find(params[:id])
        find_powered_acceptance
        render :layout => 'job'
    end

    def update
        @job = Job.find(params[:id])
        find_allegience_if_leveled
        if @acceptance
            @acceptance.save
            update_powered_rank
            redirect_to jobs_path
            return
        end
    end

    private
    def required_params
        params.require(:job).permit(:title, :description, :requirement, :reward)
    end

    def sort_by_user
        @user = User.find_by(id: params[:id])
        @jobs = Job.where(requestor_user_id: params[:id])
    end

    def update_powered_rank
        if current_user.allegience == "Hero"
            @hero = Hero.find_by(name: current_user.alter_ego)
            @heroization = Heroization.find_by(user_id: current_user.id, hero_id: @hero.id)
            @heroization.hero_rank += @job.reward
            if @heroization.hero_rank%10 == 0 && @heroization.hero_rank<=10
                @heroization.hero_level += 1
            end
            @heroization.save
        elsif current_user.allegience == "Villain"
            @villain = Villain.find_by(name: current_user.alter_ego)
            @villainization = Villainization.find_by(user_id: current_user.id, villain_id: @villain.id)
            @villainization.villain_rank += @job.reward
            if @villainization.villain_rank%10 == 0 && @villainization.villain_rank<=10
                @villainization.villain_level += 1
            end
            @villainization.save
        end
    end

    def update_civilian_rank
        current_user.civilian.update(civilian_rank: current_user.civilian.civilian_rank+5)
        if current_user.civilian.civilian_rank%10 == 0 && current_user.civilian.civilian_rank<=10
            current_user.civilian.update(civilian_level: current_user.civilian.civilian_level+1)
        end
        current_user.save
    end

    def find_powered_acceptance
        if current_user.allegience == "Hero"
            @hero = Hero.find_by(name: current_user.alter_ego)
            @heroization = Heroization.find_by(user_id: current_user.id, hero_id: @hero.id)
            @acceptance = Acceptance.find_by(job_response_id: @job.id, responder_id: current_user.id, heroization_id: @heroization.id)
        elsif current_user.allegience == "Villain"
            @villain = Villain.find_by(name: current_user.alter_ego)
            @villainization = Villainization.find_by(user_id: current_user.id, villain_id: @villain.id)
            @acceptance = Acceptance.find_by(job_response_id: @job.id, responder_id: @current_user.id, villainization_id: @villainization.id)
        end
    end

    def find_powered_heroization
        if current_user.allegience == "Hero"
            @hero = Hero.find_by(name: current_user.alter_ego)
            @heroization = Heroization.find_by(user_id: current_user.id, hero_id: @hero.id)
        elsif current_user.allegience == "Villain"
            @villain = Villain.find_by(name: current_user.alter_ego)
            @villainization = Villainization.find_by(user_id: current_user.id, villain_id: @villain.id)
        end
    end

    def find_allegience_if_leveled
        if current_user.allegience == "Hero"
            @hero = Hero.find_by(name: current_user.alter_ego)
            @heroization = Heroization.find_by(user_id: current_user.id, hero_id: @hero.id)
            if @heroization.hero_level<@job.requirement
                redirect_to job_path(@job)
                return
            else
                @acceptance = Acceptance.new(responder_id: current_user.id, job_response_id: @job.id, heroization_id: @heroization.id)
            end
        elsif current_user.allegience == "Villain"
            @villain = Villain.find_by(name: current_user.alter_ego)
            @villainization = Villainization.find_by(user_id: current_user.id, villain_id: @villain.id)
            if @villainization.villain_level<@job.requirement
                redirect_to job_path(@job)
                return
            else
                @acceptance = Acceptance.new(responder_id: current_user.id, job_response_id: @job.id, villainization_id: @villainization.id)
            end
        end
    end

end
