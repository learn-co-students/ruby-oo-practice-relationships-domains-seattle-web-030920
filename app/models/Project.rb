class Project
    attr_accessor :name, :user, pledge_goal
    @@all=[]
    def initialize (name, user, pledge_goal)
        @name=name
        @pledge_goal=pledge_goal
        @@all<<self
    end
    def self.all
        @@all
    end
    def self.no_pledges
        projects= Pledges.all.map(&:project).uniq
        @@all.select{|project| !projects.includes(project)}
    end
    def self.above_goal
        projects= Pledges.all.map(&:project).uniq
        finished=[]
        projects.each do |project|
            finished<<project if project.pledge_goal<= Pledges.all.select{|pledge| pledge.project==project}.reduce(0, :+)
        end
        finsihed
    end
    def self.most_backers
        projects= Pledges.all.map(&:project)
        projects.max_by{|pro| projects.count(pro)}
    end

end