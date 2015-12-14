require 'spec_helper'

RSpec.describe "Schemas", type: :request do
  describe "GET /schemas" do

	before(:each) do
      @connection = FactoryGirl.create(:db_connect)
    end

    it "display table names" do
     visit schemas_path(@connection)
     within "ul.tables_list" do
     	page.should have_content("articles")
     end
     page.should have_content("Пожалуйста, выберите таблицу")
    end

    it "display table columns" do
    	visit schemas_path(@connection)
     	select "articles",  from: "table-list"
     	page.should_not have_content("Пожалуйста, выберите таблицу")
     	within "table.tableelem" do
     		page.should have_content("string_1")
     	end
    end

  end
end
