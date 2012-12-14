require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: @order.attributes
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    put :update, id: @order, order: @order.attributes
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
  
  test "requires item in cart" do
    get :new
    assert_redirected to store_path
    assert_equal flash[:notice], 'Your cart is empty'
  end
  
  test "should get new" do
    item = LineItem.new
    item.build_cart
    item.product = product(:ruby)
    item.save!
    session[:cart_id] = item.cart.id
    
    get :new
    assert_response :success
  end
  
end
