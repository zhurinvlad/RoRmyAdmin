class DbConnect < ActiveRecord::Base
	validates :data_base, :username, :password, :presence => :true
	validate :working_configuration
	
	def config
	{database: data_base, username: username, password: password, adapter: 'postgresql', host: 'localhost', encoding: 'utf8'}
	end

	def to_s
		title.present? ? title : database
	end

    private

	# Be sure the connection to DB is working before store configuration
	def working_configuration
		begin
		  Schema.new(config) if errors[:database].empty?
		rescue Exception => e
		  errors.add(:database, e.to_s)
		  return false
		end
	end
end
