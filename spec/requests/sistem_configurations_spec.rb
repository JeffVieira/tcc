require 'spec_helper'

describe "SistemConfigurations" do
  describe "GET /sistem_configurations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sistem_configurations_path
      response.status.should be(200)
    end
  end
end
