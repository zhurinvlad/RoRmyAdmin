require_relative '../spec_helper'

RSpec.describe DbConnect do
 	describe "attributes" do
	    [:data_base, :username, :password].each do |attr|
	      it "have #{attr} attribute" do
	        connection = DbConnect.new
	        connection.should respond_to(attr)
	      end
	    end

    it "validate of postgres database really exist" do
      connection = DbConnect.new
      connection.data_base = "DBConnect_testNO"
      connection.username  = "postgres"
      connection.password  = "130994"
      connection.should_not be_valid
      connection.errors[:database].first.should == "FATAL:  database \"DBConnect_testNO\" does not exist\n"
      connection.data_base = "DBConnect_test"
      connection.should be_valid
    end

    end
end