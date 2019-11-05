class Recipe < ActiveRecord::Base
    belongs_to :user
    has_many :comments

    validates :name, presence: true
    validates :ingredient, presence: true 
    validates :process, presence: true

    def self.visible
        where(deleted: false)
    end
    
end
