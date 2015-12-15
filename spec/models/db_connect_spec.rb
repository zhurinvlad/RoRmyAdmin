require_relative '../spec_helper'
require 'rspec/rails'
require 'rspec/rails/mocha'
RSpec.describe DbConnect do

  it "generates a constant" do
    Object.const_defined?(:Car).should be false
    mock_model("Car")
    Object.const_defined?(:Car).should be true
  end

  it "says it is a Car" do
      car = mock_model("Car")
      car.should be_a(Car)
      Car.any_instance.stubs(:speed).returns(100)
  end

  describe "attributes" do
	    [:data_base, :username, :password].each do |attr|
	      it "have #{attr} attribute" do
	        connection = DbConnect.new
	        connection.should respond_to(attr)
	      end
	    end
	end

	describe "validations" do
    [:data_base, :username, :password].each do |attr|
      it "#{attr} is required" do
        connection = DbConnect.new
        connection.should_not be_valid
        connection.errors[attr].should_not be_blank
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


	  describe "namedb" do
	    it "respond to data_base" do
	      connection = FactoryGirl.create(:db_connect)
	      connection.should respond_to(:data_base)
	    end
	  end

	 it "to_s return database name if title nil" do
	    connection = FactoryGirl.create(:db_connect)
	    connection.data_base = nil
	    connection.to_s.should == connection.data_base
	 end

end