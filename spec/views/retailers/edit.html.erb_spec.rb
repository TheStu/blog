require 'spec_helper'

describe "retailers/edit" do
  before(:each) do
    @retailer = assign(:retailer, stub_model(Retailer,
      :name => "MyString",
      :url => "MyString",
      :what_i_say => "MyText",
      :what_they_say => "MyText",
      :cottage_industry => false
    ))
  end

  it "renders the edit retailer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", retailer_path(@retailer), "post" do
      assert_select "input#retailer_name[name=?]", "retailer[name]"
      assert_select "input#retailer_url[name=?]", "retailer[url]"
      assert_select "textarea#retailer_what_i_say[name=?]", "retailer[what_i_say]"
      assert_select "textarea#retailer_what_they_say[name=?]", "retailer[what_they_say]"
      assert_select "input#retailer_cottage_industry[name=?]", "retailer[cottage_industry]"
    end
  end
end
