require 'spec_helper'

describe "document_types/new" do
  before(:each) do
    assign(:document_type, stub_model(DocumentType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new document_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", document_types_path, "post" do
      assert_select "input#document_type_name[name=?]", "document_type[name]"
    end
  end
end
