require 'spec_helper'

describe "sistem_configurations/index" do
  before(:each) do
    assign(:sistem_configurations, [
      stub_model(SistemConfiguration,
        :notification_period => "Notification_period"
      ),
      stub_model(SistemConfiguration,
        :notification_period => "Notification_period"
      )
    ])
  end

  it "renders a list of sistem_configurations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Notification_period".to_s, :count => 2
  end
end
