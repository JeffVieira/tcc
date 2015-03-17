require 'spec_helper'

describe FoldersController do

  describe "GET 'ondex'" do
    it "returns http success" do
      get 'ondex'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
