require "spec_helper"

describe CompanyGuidesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/company_guides").to route_to("company_guides#index")
    end

    it "routes to #new" do
      expect(:get => "/company_guides/new").to route_to("company_guides#new")
    end

    it "routes to #show" do
      expect(:get => "/company_guides/1").to route_to("company_guides#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/company_guides/1/edit").to route_to("company_guides#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/company_guides").to route_to("company_guides#create")
    end

    it "routes to #update" do
      expect(:put => "/company_guides/1").to route_to("company_guides#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/company_guides/1").to route_to("company_guides#destroy", :id => "1")
    end

  end
end
