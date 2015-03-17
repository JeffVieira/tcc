require 'spec_helper'

describe "documents/show" do
  before(:each) do
    @document = assign(:document, stub_model(Document,
      :title => "Title",
      :checkout => false,
      :notification_period => "Notification_period"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/false/)
    rendered.should match(/Notification_period/)
  end
end
