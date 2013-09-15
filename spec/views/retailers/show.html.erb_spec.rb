require 'spec_helper'

describe "retailers/show" do
  before(:each) do
    @retailer = assign(:retailer, stub_model(Retailer,
      :name => "Name",
      :url => "Url",
      :what_i_say => "MyText",
      :what_they_say => "MyText",
      :cottage_industry => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Url/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
  end
end
