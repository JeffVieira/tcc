require "spec_helper"

describe SistemConfigurationsController do
  describe "routing" do

    it "routes to #index" do
      get("/sistem_configurations").should route_to("sistem_configurations#index")
    end

    it "routes to #new" do
      get("/sistem_configurations/new").should route_to("sistem_configurations#new")
    end

    it "routes to #show" do
      get("/sistem_configurations/1").should route_to("sistem_configurations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sistem_configurations/1/edit").should route_to("sistem_configurations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sistem_configurations").should route_to("sistem_configurations#create")
    end

    it "routes to #update" do
      put("/sistem_configurations/1").should route_to("sistem_configurations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sistem_configurations/1").should route_to("sistem_configurations#destroy", :id => "1")
    end

  end
end
