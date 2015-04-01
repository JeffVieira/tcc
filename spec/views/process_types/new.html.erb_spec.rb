require 'spec_helper'

describe "process/new" do
  before(:each) do
    assign(:process, stub_model(ProcessType,
      :string => ""
    ).as_new_record)
  end

  it "renders new process form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", process_path, "post" do
      assert_select "input#process_string[name=?]", "process[string]"
    end
  end
end
