require 'spec_helper'

describe "work_processes/new" do
  before(:each) do
    assign(:work_process, stub_model(WorkProcess,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new work_process form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", work_processes_path, "post" do
      assert_select "input#work_process_name[name=?]", "work_process[name]"
    end
  end
end
