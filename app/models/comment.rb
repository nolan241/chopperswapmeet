class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :pin
    
    validates :body, length: { maximum: 140 }
end
