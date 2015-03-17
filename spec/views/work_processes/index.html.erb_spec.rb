require 'spec_helper'

describe "work_processes/index" do
  before(:each) do
    assign(:work_processes, [
      stub_model(WorkProcess,
        :name => "Name"
      ),
      stub_model(WorkProcess,
        :name => "Name"
      )
    ])
  end

  it "renders a list of work_processes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
