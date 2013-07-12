namespace :app do

  task :ensure_development_environment => :environment do
    if Rails.env.production?
      raise "\nI'm sorry, Dave, I can't do that.\n
      (You're asking me to drop your production database.)"
    end
  end


desc "Reset"
task :reset => [:ensure_development_environment, "db:drop", "db:create", "db:migrate", "db:seed",
 "app:populate"]

desc "populate the database with development data"
task :populate => :environment do 
  make_users
  make_status
end
	 
    def make_users
      [
      {:first_name => "Darth", :last_name => "Vader" },
      {:first_name => "Comander", :last_name => "Praji" },
      {:first_name => "Biggs", :last_name => "Darklighter" },
      {:first_name => "Luke", :last_name => "Skywalker" },
      {:first_name => "Hans", :last_name => "solo" }

      ].each do |attributes|
        User.find_or_create_by_first_name_and_last_name(attributes)
      end
    end
 
    def make_status
      [
    {:title => "Planning",     :position => 1},
    {:title => "Implementing", :position => 2},
    {:title => "Completed",    :position => 3},
    {:title => "Maintaining",  :position => 4},
    ].each do |attributes|
    Status.find_or_create_by_title(attributes)
      end

    end
end