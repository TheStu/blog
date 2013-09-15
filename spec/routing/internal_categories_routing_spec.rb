require "spec_helper"

describe InternalCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/internal_categories").should route_to("internal_categories#index")
    end

    it "routes to #new" do
      get("/internal_categories/new").should route_to("internal_categories#new")
    end

    it "routes to #show" do
      get("/internal_categories/1").should route_to("internal_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/internal_categories/1/edit").should route_to("internal_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/internal_categories").should route_to("internal_categories#create")
    end

    it "routes to #update" do
      put("/internal_categories/1").should route_to("internal_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/internal_categories/1").should route_to("internal_categories#destroy", :id => "1")
    end

  end
end
