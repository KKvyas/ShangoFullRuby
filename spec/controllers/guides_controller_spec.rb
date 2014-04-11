require 'spec_helper'

describe GuidesController do

  let(:valid_attributes) { { "user_id" => "MyString" , "intro" => "intro", "bio" => "bio"} }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all guides as @guides" do
      guide = Guide.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:guides)).to eq([guide])
    end
  end

  describe "GET show" do
    it "assigns the requested guide as @guide" do
      guide = Guide.create! valid_attributes
      get :show, {:id => guide.to_param}, valid_session
      expect(assigns(:guide)).to eq(guide)
    end
  end

  describe "GET new" do
    it "assigns a new guide as @guide" do
      get :new, {}, valid_session
      expect(assigns(:guide)).to be_a_new(Guide)
    end
  end

  describe "GET edit" do
    it "assigns the requested guide as @guide" do
      guide = Guide.create! valid_attributes
      get :edit, {:id => guide.to_param}, valid_session
      expect(assigns(:guide)).to eq(guide)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Guide" do
        expect {
          post :create, {:guide => valid_attributes}, valid_session
        }.to change(Guide, :count).by(1)
      end

      it "assigns a newly created guide as @guide" do
        post :create, {:guide => valid_attributes}, valid_session
        expect(assigns(:guide)).to be_a(Guide)
        expect(assigns(:guide)).to be_persisted
      end

      it "redirects to the created guide" do
        post :create, {:guide => valid_attributes}, valid_session
        expect(response).to redirect_to(Guide.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved guide as @guide" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Guide).to receive(:save).and_return(false)
        post :create, {:guide => { "user_id" => "invalid value" }}, valid_session
        expect(assigns(:guide)).to be_a_new(Guide)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Guide).to receive(:save).and_return(false)
        post :create, {:guide => { "user_id" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested guide" do
        guide = Guide.create! valid_attributes
        # Assuming there are no other guides in the database, this
        # specifies that the Guide created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Guide).to receive(:update).with({ "user_id" => "MyString" })
        put :update, {:id => guide.to_param, :guide => { "user_id" => "MyString" }}, valid_session
      end

      it "assigns the requested guide as @guide" do
        guide = Guide.create! valid_attributes
        put :update, {:id => guide.to_param, :guide => valid_attributes}, valid_session
        expect(assigns(:guide)).to eq(guide)
      end

      it "redirects to the guide" do
        guide = Guide.create! valid_attributes
        put :update, {:id => guide.to_param, :guide => valid_attributes}, valid_session
        expect(response).to redirect_to(guide)
      end
    end

    describe "with invalid params" do
      it "assigns the guide as @guide" do
        guide = Guide.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Guide).to receive(:save).and_return(false)
        put :update, {:id => guide.to_param, :guide => { "user_id" => "invalid value" }}, valid_session
        expect(assigns(:guide)).to eq(guide)
      end

      it "re-renders the 'edit' template" do
        guide = Guide.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Guide).to receive(:save).and_return(false)
        put :update, {:id => guide.to_param, :guide => { "user_id" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested guide" do
      guide = Guide.create! valid_attributes
      expect {
        delete :destroy, {:id => guide.to_param}, valid_session
      }.to change(Guide, :count).by(-1)
    end

    it "redirects to the guides list" do
      guide = Guide.create! valid_attributes
      delete :destroy, {:id => guide.to_param}, valid_session
      expect(response).to redirect_to(guides_url)
    end
  end

end
