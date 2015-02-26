require 'spec_helper'

describe "controllers/edit" do
  before(:each) do
    @controller = assign(:controller, stub_model(Controller,
      :gallery => "MyString"
    ))
  end

  it "renders the edit controller form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", controller_path(@controller), "post" do
      assert_select "input#controller_gallery[name=?]", "controller[gallery]"
    end
  end
end
