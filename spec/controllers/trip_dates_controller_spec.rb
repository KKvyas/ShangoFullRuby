require 'spec_helper'
include Devise::TestHelpers

describe TripDatesController do

  let(:valid_attributes) { { "trip_id" => "1", "start_date" => '1/7/14', "end_date" => '1/7/14' } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TripDatesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all trip_dates as @trip_dates" do
      trip_date = TripDate.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:trip_dates)).to eq([trip_date])
    end
  end

  describe "GET show" do
    it "assigns the requested trip_date as @trip_date" do
      trip_date = TripDate.create! valid_attributes
      get :show, {:id => trip_date.to_param}, valid_session
      expect(assigns(:trip_date)).to eq(trip_date)
    end
  end

  describe "GET new" do
    it "assigns a new trip_date as @trip_date" do
      get :new, {}, valid_session
      expect(assigns(:trip_date)).to be_a_new(TripDate)
    end
  end

  describe "GET edit" do
    it "assigns the requested trip_date as @trip_date" do
      trip_date = TripDate.create! valid_attributes
      get :edit, {:id => trip_date.to_param}, valid_session
      expect(assigns(:trip_date)).to eq(trip_date)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TripDate" do
        expect {
          post :create, {:trip_date => valid_attributes}, valid_session
        }.to change(TripDate, :count).by(1)
      end

      it "assigns a newly created trip_date as @trip_date" do
        post :create, {:trip_date => valid_attributes}, valid_session
        expect(assigns(:trip_date)).to be_a(TripDate)
        expect(assigns(:trip_date)).to be_persisted
      end

      it "redirects to the created trip_date" do
        post :create, {:trip_date => valid_attributes}, valid_session
        expect(response).to redirect_to(TripDate.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved trip_date as @trip_date" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(TripDate).to receive(:save).and_return(false)
        post :create, {:trip_date => { "trip_id" => "invalid value" }}, valid_session
        expect(assigns(:trip_date)).to be_a_new(TripDate)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(TripDate).to receive(:save).and_return(false)
        post :create, {:trip_date => { "trip_id" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested trip_date" do
        trip_date = TripDate.create! valid_attributes
        # Assuming there are no other trip_dates in the database, this
        # specifies that the TripDate created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(TripDate).to receive(:update).with({ "trip_id" => "1" })
        put :update, {:id => trip_date.to_param, :trip_date => { "trip_id" => "1" }}, valid_session
      end

      it "assigns the requested trip_date as @trip_date" do
        trip_date = TripDate.create! valid_attributes
        put :update, {:id => trip_date.to_param, :trip_date => valid_attributes}, valid_session
        expect(assigns(:trip_date)).to eq(trip_date)
      end

      it "redirects to the trip_date" do
        trip_date = TripDate.create! valid_attributes
        put :update, {:id => trip_date.to_param, :trip_date => valid_attributes}, valid_session
        expect(response).to redirect_to(trip_date)
      end
    end

    describe "with invalid params" do
      it "assigns the trip_date as @trip_date" do
        trip_date = TripDate.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(TripDate).to receive(:save).and_return(false)
        put :update, {:id => trip_date.to_param, :trip_date => { "trip_id" => "invalid value" }}, valid_session
        expect(assigns(:trip_date)).to eq(trip_date)
      end

      it "re-renders the 'edit' template" do
        trip_date = TripDate.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(TripDate).to receive(:save).and_return(false)
        put :update, {:id => trip_date.to_param, :trip_date => { "trip_id" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested trip_date" do
      trip_date = TripDate.create! valid_attributes
      expect {
        delete :destroy, {:id => trip_date.to_param}, valid_session
      }.to change(TripDate, :count).by(-1)
    end

    it "redirects to the trip_dates list" do
      trip_date = TripDate.create! valid_attributes
      delete :destroy, {:id => trip_date.to_param}, valid_session
      expect(response).to redirect_to(trip_dates_url)
    end
  end

end
