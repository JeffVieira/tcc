require 'spec_helper'

describe "process/show" do
  before(:each) do
    @process = assign(:process, stub_model(ProcessType,
      :string => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
