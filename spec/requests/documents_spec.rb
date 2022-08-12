require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/documents", type: :request do
  
  # Document. As you add validations to Document, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Document.create! valid_attributes
      get documents_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      document = Document.create! valid_attributes
      get document_url(document)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_document_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      document = Document.create! valid_attributes
      get edit_document_url(document)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Document" do
        expect {
          post documents_url, params: { document: valid_attributes }
        }.to change(Document, :count).by(1)
      end

      it "redirects to the created document" do
        post documents_url, params: { document: valid_attributes }
        expect(response).to redirect_to(document_url(Document.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Document" do
        expect {
          post documents_url, params: { document: invalid_attributes }
        }.to change(Document, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post documents_url, params: { document: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested document" do
        document = Document.create! valid_attributes
        patch document_url(document), params: { document: new_attributes }
        document.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the document" do
        document = Document.create! valid_attributes
        patch document_url(document), params: { document: new_attributes }
        document.reload
        expect(response).to redirect_to(document_url(document))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        document = Document.create! valid_attributes
        patch document_url(document), params: { document: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested document" do
      document = Document.create! valid_attributes
      expect {
        delete document_url(document)
      }.to change(Document, :count).by(-1)
    end

    it "redirects to the documents list" do
      document = Document.create! valid_attributes
      delete document_url(document)
      expect(response).to redirect_to(documents_url)
    end
  end
end
