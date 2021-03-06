require 'spec_helper'

describe "retailers/index" do
  before(:each) do
    assign(:retailers, [
      stub_model(Retailer,
        :name => "Name",
        :url => "Url",
        :what_i_say => "MyText",
        :what_they_say => "MyText",
        :cottage_industry => false
      ),
      stub_model(Retailer,
        :name => "Name",
        :url => "Url",
        :what_i_say => "MyText",
        :what_they_say => "MyText",
        :cottage_industry => false
      )
    ])
  end

  it "renders a list of retailers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
