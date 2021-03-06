class JobsController < ApplicationController
    before_action :authentication_required
    def new
        @job = Job.new
        render :layout => 'job'
    end

    def index
        if params[:format]
            @jobs = Job.all.where(requirement: params[:format]).where.not(id: Job::STORY_EXCLUSION)
        elsif params[:user_id]
            sort_by_user
        elsif params[:story]
            @jobs = Job.where(id: Job::STORY_EXCLUSION)
            @story = ""
        else
            @jobs = Job.where.not(id: Job::STORY_EXCLUSION)
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
        @exclusion = Job::STORY_EXCLUSION
        render :layout => 'job'
    end

    def update
        @job = Job.find(params[:id])
        find_allegience_if_leveled
        if @acceptance
            @acceptance.save
            update_powered_rank
            if Job.where(id: Job::STORY_EXCLUSION).include?(Job.find_by(id:params[:id]))
                redirect_to jobs_path(story: "story")
                return
            else
                redirect_to jobs_path
                return
            end
        end
    end

    private
    def required_params
        params.require(:job).permit(:title, :description, :requirement, :reward)
    end

    def sort_by_user
        @user = User.find_by(id: params[:user_id])
        @jobs = Job.where(requestor_user_id: params[:user_id])
    end

    def update_powered_rank
        if current_user.allegience == "Hero"
            @hero = Hero.find_by(name: current_user.alter_ego)
            @heroization = Heroization.find_by(user_id: current_user.id, hero_id: @hero.id)
            @heroization.hero_rank += @job.reward
            if @job.power_reward_hero != nil
                @heroization.powers << Power.find_by(name: @job.power_reward_hero)
            end
            Job::LEVELS.each do |level|
                if @heroization.hero_rank >= (level*10) && @heroization.hero_rank<= (level*10+9) && @heroization.hero_level != level
                    @heroization.hero_level += 1
                elsif @heroization.hero_rank>=100 && @heroization.hero_rank<=109 && @heroization.hero_rank != 10
                    @heroization.hero_level += 1
                end
            end 
            @heroization.save
        elsif current_user.allegience == "Villain"
            @villain = Villain.find_by(name: current_user.alter_ego)
            @villainization = Villainization.find_by(user_id: current_user.id, villain_id: @villain.id)
            @villainization.villain_rank += @job.reward
            if @job.power_reward_villain != nil
                @villainization.powers << Power.find_by(name: @job.power_reward_villain)
            end
            Job::LEVELS.each do |level|
                if @villainization.villain_rank >= (level*10) && @villainization.villain_rank<= (level*10+9) && @villainization.villain_level != level
                    @villainization.villain_level += 1
                elsif @villainization.villain_rank>=100 && @villainization.villain_rank<=109 && @villainization.villain_level != 10
                    @villainization.villain_level += 1
                end
            end 
            @villainization.save
        end
    end

    def update_civilian_rank
        current_user.civilian.update(civilian_rank: current_user.civilian.civilian_rank+5)
        Job::LEVELS.each do |level|
            if current_user.civilian.civilian_rank >= (level*10) && current_user.civilian.civilian_rank<= (level*10+9) && current_user.civilian.civilian_level != level
                current_user.civilian.update(civilian_level: current_user.civilian.civilian_level+1)
            elsif current_user.civilian.civilian_rank >= 100 && current_user.civilian.civilian_rank<= 109 && current_user.civilian.civilian_level != 10
                current_user.civilian.update(civilian_level: current_user.civilian.civilian_level+1)
            end
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
            @acceptance = Acceptance.find_by(job_response_id: @job.id, responder_id: current_user.id, villainization_id: @villainization.id)
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
                flash[:message] = "LOCKED"
                return
            else
                @acceptance = Acceptance.new(responder_id: current_user.id, job_response_id: @job.id, heroization_id: @heroization.id)
            end
        elsif current_user.allegience == "Villain"
            @villain = Villain.find_by(name: current_user.alter_ego)
            @villainization = Villainization.find_by(user_id: current_user.id, villain_id: @villain.id)
            if @villainization.villain_level<@job.requirement
                flash[:message] = "LOCKED"
                redirect_to job_path(@job)
                return
            else
                @acceptance = Acceptance.new(responder_id: current_user.id, job_response_id: @job.id, villainization_id: @villainization.id)
            end
        end
    end

end
