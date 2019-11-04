class Recipe < ActiveRecord::Base
    belongs_to :user
    has_many :comments

    validates :name, presence: true
    validates :ingredient, presence: true 
    validates :process, presence: true

    def self.visible
        where(deleted: false)
    end

    def slug 
        @name = name.split(" ") 
        @slug = @name.join("-").downcase
    end

    def self.find_by_slug(slug)
        Recipe.all.each do |recipe| 
            if recipe.slug == slug 
               return recipe
            end
        end
        nil
    end
end
