require 'spec_helper'

describe "internal_categories/new" do
  before(:each) do
    assign(:internal_category, stub_model(InternalCategory,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new internal_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", internal_categories_path, "post" do
      assert_select "input#internal_category_name[name=?]", "internal_category[name]"
    end
  end
end
