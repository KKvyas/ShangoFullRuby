require 'spec_helper'


describe FeaturesController do

  # This should return the minimal set of attributes required to create a valid
  # Feature. As you add validations to Feature, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "location_id" => "1", "name" => "name" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FeaturesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all features as @features" do
      feature = Feature.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:features)).to eq([feature])
    end
  end

  describe "GET show" do
    it "assigns the requested feature as @feature" do
      feature = Feature.create! valid_attributes
      get :show, {:id => feature.to_param}, valid_session
      expect(assigns(:feature)).to eq(feature)
    end
  end

  describe "GET new" do
    it "assigns a new feature as @feature" do
      get :new, {}, valid_session
      expect(assigns(:feature)).to be_a_new(Feature)
    end
  end

  describe "GET edit" do
    it "assigns the requested feature as @feature" do
      feature = Feature.create! valid_attributes
      get :edit, {:id => feature.to_param}, valid_session
      expect(assigns(:feature)).to eq(feature)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Feature" do
        expect {
          post :create, {:feature => valid_attributes}, valid_session
        }.to change(Feature, :count).by(1)
      end

      it "assigns a newly created feature as @feature" do
        post :create, {:feature => valid_attributes}, valid_session
        expect(assigns(:feature)).to be_a(Feature)
        expect(assigns(:feature)).to be_persisted
      end

      it "redirects to the created feature" do
        post :create, {:feature => valid_attributes}, valid_session
        expect(response).to redirect_to(Feature.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved feature as @feature" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Feature).to receive(:save).and_return(false)
        post :create, {:feature => { "location_id" => "invalid value" }}, valid_session
        expect(assigns(:feature)).to be_a_new(Feature)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Feature).to receive(:save).and_return(false)
        post :create, {:feature => { "location_id" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested feature" do
        feature = Feature.create! valid_attributes
        # Assuming there are no other features in the database, this
        # specifies that the Feature created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Feature).to receive(:update).with({ "location_id" => "1" })
        put :update, {:id => feature.to_param, :feature => { "location_id" => "1" }}, valid_session
      end

      it "assigns the requested feature as @feature" do
        feature = Feature.create! valid_attributes
        put :update, {:id => feature.to_param, :feature => valid_attributes}, valid_session
        expect(assigns(:feature)).to eq(feature)
      end

      it "redirects to the feature" do
        feature = Feature.create! valid_attributes
        put :update, {:id => feature.to_param, :feature => valid_attributes}, valid_session
        expect(response).to redirect_to(feature)
      end
    end

    describe "with invalid params" do
      it "assigns the feature as @feature" do
        feature = Feature.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Feature).to receive(:save).and_return(false)
        put :update, {:id => feature.to_param, :feature => { "location_id" => "invalid value" }}, valid_session
        expect(assigns(:feature)).to eq(feature)
      end

      it "re-renders the 'edit' template" do
        feature = Feature.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Feature).to receive(:save).and_return(false)
        put :update, {:id => feature.to_param, :feature => { "location_id" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested feature" do
      feature = Feature.create! valid_attributes
      expect {
        delete :destroy, {:id => feature.to_param}, valid_session
      }.to change(Feature, :count).by(-1)
    end

    it "redirects to the features list" do
      feature = Feature.create! valid_attributes
      delete :destroy, {:id => feature.to_param}, valid_session
      expect(response).to redirect_to(features_url)
    end
  end

end
