require 'spec_helper'

describe "work_processes/show" do
  before(:each) do
    @work_process = assign(:work_process, stub_model(WorkProcess,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
