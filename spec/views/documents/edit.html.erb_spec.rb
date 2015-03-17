require 'spec_helper'

describe "documents/edit" do
  before(:each) do
    @document = assign(:document, stub_model(Document,
      :title => "MyString",
      :checkout => false,
      :notification_period => "MyString"
    ))
  end

  it "renders the edit document form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", document_path(@document), "post" do
      assert_select "input#document_title[name=?]", "document[title]"
      assert_select "input#document_checkout[name=?]", "document[checkout]"
      assert_select "input#document_notification_period[name=?]", "document[notification_period]"
    end
  end
end
