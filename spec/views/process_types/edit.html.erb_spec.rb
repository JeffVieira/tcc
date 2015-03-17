require 'spec_helper'

describe "process_types/edit" do
  before(:each) do
    @process_type = assign(:process_type, stub_model(ProcessType,
      :string => ""
    ))
  end

  it "renders the edit process_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", process_type_path(@process_type), "post" do
      assert_select "input#process_type_string[name=?]", "process_type[string]"
    end
  end
end
