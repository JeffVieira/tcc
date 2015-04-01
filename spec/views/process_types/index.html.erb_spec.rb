require 'spec_helper'

describe "process/index" do
  before(:each) do
    assign(:process, [
      stub_model(ProcessType,
        :string => ""
      ),
      stub_model(ProcessType,
        :string => ""
      )
    ])
  end

  it "renders a list of process" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
