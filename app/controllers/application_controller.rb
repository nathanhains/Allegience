class ApplicationController < ActionController::Base
    before_action :current_user
    before_action :go_home, only: :home
    def home
    end

    private
        def current_user
            if session[:current_user_id]
                #memoization
                @current_user ||= User.find_by_id(session[:current_user_id])
            end
        end

        def check_authorization
            unless current_user.id == params[:id].to_i
                redirect_to root_path
            end
        end

        def login(user)
            session[:current_user_id] = @user.id
        end

        def logged_in?
            !!current_user
        end

        def authentication_required
            if !logged_in?
                redirect_to "/login"
            end
        end

        def maximum_characters
            if (current_user.heros.count+current_user.villains.count>=4)
                redirect_to profile_path(current_user)
            end
        end

        def go_home
            if logged_in?
                redirect_to user_path(current_user)
            end
        end
end
