require 'rails_helper'

RSpec.describe "DbConnects", type: :request do
  describe "GET /db_connects" do
    it "works! (now write some real specs)" do
      get db_connects_path
      expect(response).to have_http_status(200)
    end
  end
end
