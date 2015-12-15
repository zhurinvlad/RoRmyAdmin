require 'spec_helper'


RSpec.describe "DbConnects", type: :request do
	describe "list" do

	before(:each) do
      @connection = FactoryGirl.create(:db_connect)
    end
      it "#click link database" do
		  visit db_connects_path
	      click_link @connection.data_base
	      current_path.should eq(schemas_path(@connection))
      end
      
      it "#null click link database" do
		  visit db_connects_path
		  expect { click_link 'Удалить' }.to change(DbConnect, :count).by(-1)
	  end

      it "#list table in database" do
		  visit db_connects_path
	      click_link @connection.data_base
	      page.all('select#table-list option', :text => 'articles').map(&:value).should == %w(articles)
      end
    end


    describe "GET /db_connects/:id/edit" do
    		before(:each) do
      @connection = FactoryGirl.create(:db_connect)
    end
	    it "display link for edit in list" do
	      visit db_connects_path
	      page.should have_content(@connection.data_base)
	      click_on "Изменить"
	      current_path.should == edit_db_connect_path(@connection)
	      #page.should have_content("Edit Database connection")
	    end
	end

	describe "DELETE /db_connects/:id" do
    before(:each) do
      @connection = FactoryGirl.create(:db_connect)
    end

    it "display link for destroy in list" do
      visit db_connects_path
      page.should have_content(@connection.data_base)
      #evaluate_script 'window.confirm = function() { return true; }'
      click_on "Удалить"
      current_path.should == db_connects_path
     # page.should have_content("No connection to database created yet. Create new !")
    end
  end


  describe "POST /db_connects" do
    it "validate adapter and database name" do
      visit new_db_connect_path
      click_on "Принять"
      page.should have_content("can't be blank")
    end

 	it "validate adapter and database name" do
      visit new_db_connect_path
      page.should have_content("База данных")
      page.should have_content("Пользователь")
      page.should have_content("Пароль")
    end
  end



  describe "POST /db_connects" do
    it "back in list connects" do
      visit new_db_connect_path
      click_on "Принять"
      click_on "Список подключений"
      page.should have_content("Доступные подключения к базам")
    end

  end

end
