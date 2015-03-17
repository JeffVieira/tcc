require 'spec_helper'

describe "document_types/edit" do
  before(:each) do
    @document_type = assign(:document_type, stub_model(DocumentType,
      :name => "MyString"
    ))
  end

  it "renders the edit document_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", document_type_path(@document_type), "post" do
      assert_select "input#document_type_name[name=?]", "document_type[name]"
    end
  end
end
