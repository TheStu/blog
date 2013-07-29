require 'spec_helper'

describe "gear_guides/new" do
  before(:each) do
    assign(:gear_guide, stub_model(GearGuide,
      :user_id => 1,
      :title => "MyString",
      :content => "MyText",
      :meta_description => "MyString"
    ).as_new_record)
  end

  it "renders new gear_guide form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", gear_guides_path, "post" do
      assert_select "input#gear_guide_user_id[name=?]", "gear_guide[user_id]"
      assert_select "input#gear_guide_title[name=?]", "gear_guide[title]"
      assert_select "textarea#gear_guide_content[name=?]", "gear_guide[content]"
      assert_select "input#gear_guide_meta_description[name=?]", "gear_guide[meta_description]"
    end
  end
end
