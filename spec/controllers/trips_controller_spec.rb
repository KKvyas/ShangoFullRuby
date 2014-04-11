require 'spec_helper'

describe TripsController do

  let(:valid_attributes) { {  "activity_id" => 1,
                              "guide_id" => 1,
                              "difficulty_id" => 1,
                              "location_id" => 1,
                              "trip_length_id" => 1,
                              "company_id" => 1,
                              "first_person_cost" => 150,
                              "second_person_cost" => 100,
                              "description" => 'description',
                          } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TripsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all trips as @trips" do
      trip = Trip.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:trips)).to eq([trip])
    end
  end

  describe "GET show" do
    it "assigns the requested trip as @trip" do
      trip = Trip.create! valid_attributes
      get :show, {:id => trip.to_param}, valid_session
      expect(assigns(:trip)).to eq(trip)
    end
  end

  describe "GET new" do
    it "assigns a new trip as @trip" do
      get :new, {}, valid_session
      expect(assigns(:trip)).to be_a_new(Trip)
    end
  end

  describe "GET edit" do
    it "assigns the requested trip as @trip" do
      trip = Trip.create! valid_attributes
      get :edit, {:id => trip.to_param}, valid_session
      expect(assigns(:trip)).to eq(trip)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Trip" do
        expect {
          post :create, {:trip => valid_attributes}, valid_session
        }.to change(Trip, :count).by(1)
      end

      it "assigns a newly created trip as @trip" do
        post :create, {:trip => valid_attributes}, valid_session
        expect(assigns(:trip)).to be_a(Trip)
        expect(assigns(:trip)).to be_persisted
      end

      it "redirects to the created trip" do
        post :create, {:trip => valid_attributes}, valid_session
        expect(response).to redirect_to(Trip.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved trip as @trip" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Trip).to receive(:save).and_return(false)
        post :create, {:trip => { "activity_id" => "invalid value" }}, valid_session
        expect(assigns(:trip)).to be_a_new(Trip)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Trip).to receive(:save).and_return(false)
        post :create, {:trip => { "activity_id" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested trip" do
        trip = Trip.create! valid_attributes
        # Assuming there are no other trips in the database, this
        # specifies that the Trip created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Trip).to receive(:update).with({ "activity_id" => "MyString" })
        put :update, {:id => trip.to_param, :trip => { "activity_id" => "MyString" }}, valid_session
      end

      it "assigns the requested trip as @trip" do
        trip = Trip.create! valid_attributes
        put :update, {:id => trip.to_param, :trip => valid_attributes}, valid_session
        expect(assigns(:trip)).to eq(trip)
      end

      it "redirects to the trip" do
        trip = Trip.create! valid_attributes
        put :update, {:id => trip.to_param, :trip => valid_attributes}, valid_session
        expect(response).to redirect_to(trip)
      end
    end

    describe "with invalid params" do
      it "assigns the trip as @trip" do
        trip = Trip.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Trip).to receive(:save).and_return(false)
        put :update, {:id => trip.to_param, :trip => { "activity_id" => "invalid value" }}, valid_session
        expect(assigns(:trip)).to eq(trip)
      end

      it "re-renders the 'edit' template" do
        trip = Trip.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Trip).to receive(:save).and_return(false)
        put :update, {:id => trip.to_param, :trip => { "activity_id" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested trip" do
      trip = Trip.create! valid_attributes
      expect {
        delete :destroy, {:id => trip.to_param}, valid_session
      }.to change(Trip, :count).by(-1)
    end

    it "redirects to the trips list" do
      trip = Trip.create! valid_attributes
      delete :destroy, {:id => trip.to_param}, valid_session
      expect(response).to redirect_to(trips_url)
    end
  end

end
