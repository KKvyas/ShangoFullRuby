require 'spec_helper'


describe OrdersController do

  # This should return the minimal set of attributes required to create a valid
  # Order. As you add validations to Order, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OrdersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  def user_sign_in
      @user ||= FactoryGirl.create :user
      sign_in @user
  end   


  ######
  #
  # I can't get the following to work with devise helper current_user
  #
  ######

  # describe "GET new" do
  #   it "assigns a new order as @order" do
  #     get :new, {}, valid_session
  #     expect(assigns(:order)).to be_a_new(Order)
  #   end
  # end

  # describe "POST create" do
  #   describe "with valid params" do
  #     it "creates a new Order" do
  #       expect {
  #         post :create, {:order => valid_attributes}, valid_session
  #       }.to change(Order, :count).by(1)
  #     end

  #     it "assigns a newly created order as @order" do
  #       post :create, {:order => valid_attributes}, valid_session
  #       expect(assigns(:order)).to be_a(Order)
  #       expect(assigns(:order)).to be_persisted
  #     end

  #     it "redirects to the user profile" do
  #       post :create, {:order => valid_attributes}, valid_session
  #       expect(response).to redirect_to(profile_path)
  #     end
  #   end

  # end

  describe "GET index" do
    it "assigns all orders as @orders" do
      order = Order.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:orders)).to eq([order])
    end
  end

  describe "GET show" do
    it "assigns the requested order as @order" do
      order = Order.create! valid_attributes
      get :show, {:id => order.to_param}, valid_session
      expect(assigns(:order)).to eq(order)
    end
  end

  describe "GET edit" do
    it "assigns the requested order as @order" do
      order = Order.create!
      get :edit, {:id => order.to_param}, valid_session
      expect(assigns(:order)).to eq(order)
    end
  end


  describe "DELETE destroy" do
    it "destroys the requested order" do
      order = Order.create! valid_attributes
      expect {
        delete :destroy, {:id => order.to_param}, valid_session
      }.to change(Order, :count).by(-1)
    end

    it "redirects to the orders list" do
      order = Order.create! valid_attributes
      delete :destroy, {:id => order.to_param}, valid_session
      expect(response).to redirect_to(orders_url)
    end
  end

end
