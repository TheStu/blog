require 'spec_helper'

describe "internal_categories/edit" do
  before(:each) do
    @internal_category = assign(:internal_category, stub_model(InternalCategory,
      :name => "MyString"
    ))
  end

  it "renders the edit internal_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", internal_category_path(@internal_category), "post" do
      assert_select "input#internal_category_name[name=?]", "internal_category[name]"
    end
  end
end
