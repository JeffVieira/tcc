require 'spec_helper'

describe "documents/index" do
  before(:each) do
    assign(:documents, [
      stub_model(Document,
        :title => "Title",
        :checkout => false,
        :notification_period => "Notification_period"
      ),
      stub_model(Document,
        :title => "Title",
        :checkout => false,
        :notification_period => "Notification_period"
      )
    ])
  end

  it "renders a list of documents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Notification_period".to_s, :count => 2
  end
end
