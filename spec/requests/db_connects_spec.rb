require 'spec_helper'


RSpec.describe "DbConnects", type: :request do
	describe "list" do

      it "#click link database" do
      	  connection = FactoryGirl.create(:db_connect)
		  visit db_connects_path
	      click_link connection.data_base
	      current_path.should eq(schemas_path(connection))
      end
      
      it "#null click link database" do
      	  connection = FactoryGirl.create(:db_connect)
		  visit db_connects_path
		  expect { click_link 'Удалить' }.to change(DbConnect, :count).by(-1)
	  end

      it "#list table in database" do
      	  connection = FactoryGirl.create(:db_connect)
		  visit db_connects_path
	      click_link connection.data_base
	      page.all('select#table-list option', :text => 'articles').map(&:value).should == %w(articles)
      end
    end
end
