require "spec_helper"

describe GearGuidesController do
  describe "routing" do

    it "routes to #index" do
      get("/gear_guides").should route_to("gear_guides#index")
    end

    it "routes to #new" do
      get("/gear_guides/new").should route_to("gear_guides#new")
    end

    it "routes to #show" do
      get("/gear_guides/1").should route_to("gear_guides#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gear_guides/1/edit").should route_to("gear_guides#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gear_guides").should route_to("gear_guides#create")
    end

    it "routes to #update" do
      put("/gear_guides/1").should route_to("gear_guides#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gear_guides/1").should route_to("gear_guides#destroy", :id => "1")
    end

  end
end
