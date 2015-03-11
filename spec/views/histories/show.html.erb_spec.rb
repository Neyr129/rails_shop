require 'spec_helper'

describe "histories/show" do
  before(:each) do
    @history = assign(:history, stub_model(History))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
