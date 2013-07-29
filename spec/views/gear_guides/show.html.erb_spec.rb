require 'spec_helper'

describe "gear_guides/show" do
  before(:each) do
    @gear_guide = assign(:gear_guide, stub_model(GearGuide,
      :user_id => 1,
      :title => "Title",
      :content => "MyText",
      :meta_description => "Meta Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/Meta Description/)
  end
end
