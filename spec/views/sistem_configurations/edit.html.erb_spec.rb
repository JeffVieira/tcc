require 'spec_helper'

describe "sistem_configurations/edit" do
  before(:each) do
    @sistem_configuration = assign(:sistem_configuration, stub_model(SistemConfiguration,
      :notification_period => "MyString"
    ))
  end

  it "renders the edit sistem_configuration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sistem_configuration_path(@sistem_configuration), "post" do
      assert_select "input#sistem_configuration_notification_period[name=?]", "sistem_configuration[notification_period]"
    end
  end
end
