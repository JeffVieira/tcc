require 'spec_helper'

describe "document_types/show" do
  before(:each) do
    @document_type = assign(:document_type, stub_model(DocumentType,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
