require "spec_helper"

describe WorkProcessesController do
  describe "routing" do

    it "routes to #index" do
      get("/work_processes").should route_to("work_processes#index")
    end

    it "routes to #new" do
      get("/work_processes/new").should route_to("work_processes#new")
    end

    it "routes to #show" do
      get("/work_processes/1").should route_to("work_processes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/work_processes/1/edit").should route_to("work_processes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/work_processes").should route_to("work_processes#create")
    end

    it "routes to #update" do
      put("/work_processes/1").should route_to("work_processes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/work_processes/1").should route_to("work_processes#destroy", :id => "1")
    end

  end
end
