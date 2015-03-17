require 'spec_helper'

describe "work_processes/edit" do
  before(:each) do
    @work_process = assign(:work_process, stub_model(WorkProcess,
      :name => "MyString"
    ))
  end

  it "renders the edit work_process form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", work_process_path(@work_process), "post" do
      assert_select "input#work_process_name[name=?]", "work_process[name]"
    end
  end
end
