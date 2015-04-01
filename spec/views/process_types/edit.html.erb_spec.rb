require 'spec_helper'

describe "process/edit" do
  before(:each) do
    @process = assign(:process, stub_model(ProcessType,
      :string => ""
    ))
  end

  it "renders the edit process form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", process_path(@process), "post" do
      assert_select "input#process_string[name=?]", "process[string]"
    end
  end
end
