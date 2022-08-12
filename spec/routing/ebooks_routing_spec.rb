require "rails_helper"

RSpec.describe EbooksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/ebooks").to route_to("ebooks#index")
    end

    it "routes to #new" do
      expect(get: "/ebooks/new").to route_to("ebooks#new")
    end

    it "routes to #show" do
      expect(get: "/ebooks/1").to route_to("ebooks#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/ebooks/1/edit").to route_to("ebooks#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/ebooks").to route_to("ebooks#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/ebooks/1").to route_to("ebooks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/ebooks/1").to route_to("ebooks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/ebooks/1").to route_to("ebooks#destroy", id: "1")
    end
  end
end
