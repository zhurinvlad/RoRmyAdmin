class DbConnect < ActiveRecord::Base
	  validates :data_base, :username, :password, :presence => :true
end
