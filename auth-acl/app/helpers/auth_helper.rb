module AuthHelper
    def login(user)
        session[:user] = user.id
    end

    def current
        @current_user ||= User.find_by(id: session[:user])
    end

    def block_access
        if current.present?
            redirect_to new_user_path
        end
    end

    def logout
        if current.present?
            session.delete(:user)
            @current_user = nil
            redirect_to new_user_path
        end
    end
end
