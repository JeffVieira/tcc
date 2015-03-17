require 'spec_helper'

describe "document_types/index" do
  before(:each) do
    assign(:document_types, [
      stub_model(DocumentType,
        :name => "Name"
      ),
      stub_model(DocumentType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of document_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
