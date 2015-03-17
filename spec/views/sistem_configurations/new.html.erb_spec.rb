require 'spec_helper'

describe "sistem_configurations/new" do
  before(:each) do
    assign(:sistem_configuration, stub_model(SistemConfiguration,
      :notification_period => "MyString"
    ).as_new_record)
  end

  it "renders new sistem_configuration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sistem_configurations_path, "post" do
      assert_select "input#sistem_configuration_notification_period[name=?]", "sistem_configuration[notification_period]"
    end
  end
end
