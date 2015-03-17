require 'spec_helper'

describe "process_types/show" do
  before(:each) do
    @process_type = assign(:process_type, stub_model(ProcessType,
      :string => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
