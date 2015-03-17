require 'spec_helper'

describe "process_types/new" do
  before(:each) do
    assign(:process_type, stub_model(ProcessType,
      :string => ""
    ).as_new_record)
  end

  it "renders new process_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", process_types_path, "post" do
      assert_select "input#process_type_string[name=?]", "process_type[string]"
    end
  end
end
