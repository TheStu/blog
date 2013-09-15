require 'spec_helper'

describe "internal_categories/index" do
  before(:each) do
    assign(:internal_categories, [
      stub_model(InternalCategory,
        :name => "Name"
      ),
      stub_model(InternalCategory,
        :name => "Name"
      )
    ])
  end

  it "renders a list of internal_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
