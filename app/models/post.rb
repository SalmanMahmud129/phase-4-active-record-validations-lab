class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

    validate :click_bait?


    def click_bait?
        
        keywords = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]
         if keywords.any? {|word| word.match(title)}
            true
         else
            errors.add(:title, "Not click-baity enough")
         end
        # if title == "True Facts" 
        #     errors.add(:title, "Title not allowed")
        # end

        # title.
    end
end
