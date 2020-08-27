class User
    attr_accessor :name
    @@all=[]
    def initialize (name)
        @name=name
        @@all<<self
    end
    def self.all
        @@all
    end
    def self.highest_pledge
        Pledge.all.max_by{|pledge| pledge.pledge}.user
    end
    def self.multi_pledger
        users=Pledge.all.map(&:user)
        users.select{ |user| users.count(user)>1}
    end
    def self.project_creator
        Project.all.map(:user).uniq
    end

end