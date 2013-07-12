class Role < ActiveRecord::Base
  attr_accessible :project_id, :status_id, :title, :user_id
end
