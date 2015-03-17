require 'spec_helper'

describe "sistem_configurations/show" do
  before(:each) do
    @sistem_configuration = assign(:sistem_configuration, stub_model(SistemConfiguration,
      :notification_period => "Notification_period"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Notification_period/)
  end
end
