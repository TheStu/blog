require 'spec_helper'

describe "internal_categories/show" do
  before(:each) do
    @internal_category = assign(:internal_category, stub_model(InternalCategory,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
