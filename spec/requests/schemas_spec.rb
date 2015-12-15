require 'spec_helper'

RSpec.describe "Schemas", type: :request do
  describe "GET /db_connect/:id/schemas" do

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
  end
end
