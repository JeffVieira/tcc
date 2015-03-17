require "spec_helper"

describe ProcessTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/process_types").should route_to("process_types#index")
    end

    it "routes to #new" do
      get("/process_types/new").should route_to("process_types#new")
    end

    it "routes to #show" do
      get("/process_types/1").should route_to("process_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/process_types/1/edit").should route_to("process_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/process_types").should route_to("process_types#create")
    end

    it "routes to #update" do
      put("/process_types/1").should route_to("process_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/process_types/1").should route_to("process_types#destroy", :id => "1")
    end

  end
end
