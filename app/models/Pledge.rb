class Pledge
    attr_accessor :user, :project, :pledge
    @@all=[]

    def initialize (user, pledge, project)
        @user=user
        @pledge=pledge
        @project=project
        @@all<<self
    end

    def self.all
        @@all
    end
end