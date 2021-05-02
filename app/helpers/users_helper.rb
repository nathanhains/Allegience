module UsersHelper
    def avatar_for(user, options = { size: 70})
        size = options[:size]
        if user.avatar?
            # width in place of size
            image_tag user.avatar.url(:thumb), size: size, class: 'avatar-image'
        else
            image_tag "Unknown.png", size: size, class: 'avatar-image'
        end
    end
    
    def avatar_civ(user, options = { size: 70})
        size = options[:size]
        if user.avatar?
            # width in place of size
            image_tag user.avatar.url(:thumb), size: size, class: 'avatar-civ'
        else
            image_tag "Unknown.png", size: size, class: 'avatar-image'
        end
    end

    def avatar_hero(user, options = { size: 70})
        size = options[:size]
        if user.avatar?
            # width in place of size
            image_tag user.avatar.url(:thumb), size: size, class: 'avatar-hero'
        else
            image_tag "Unknown.png", size: size, class: 'avatar-image'
        end
    end

    def avatar_villain(user, options = { size: 70})
        size = options[:size]
        if user.avatar?
            # width in place of size
            image_tag user.avatar.url(:thumb), size: size, class: 'avatar-villain'
        else
            image_tag "Unknown.png", size: size, class: 'avatar-image'
        end
    end
end
