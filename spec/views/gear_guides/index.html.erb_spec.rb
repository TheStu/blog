require 'spec_helper'

describe "gear_guides/index" do
  before(:each) do
    assign(:gear_guides, [
      stub_model(GearGuide,
        :user_id => 1,
        :title => "Title",
        :content => "MyText",
        :meta_description => "Meta Description"
      ),
      stub_model(GearGuide,
        :user_id => 1,
        :title => "Title",
        :content => "MyText",
        :meta_description => "Meta Description"
      )
    ])
  end

  it "renders a list of gear_guides" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Meta Description".to_s, :count => 2
  end
end
