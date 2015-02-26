require 'spec_helper'

describe "controllers/new" do
  before(:each) do
    assign(:controller, stub_model(Controller,
      :gallery => "MyString"
    ).as_new_record)
  end

  it "renders new controller form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", controllers_path, "post" do
      assert_select "input#controller_gallery[name=?]", "controller[gallery]"
    end
  end
end
