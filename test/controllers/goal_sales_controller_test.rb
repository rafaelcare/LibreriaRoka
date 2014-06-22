require 'test_helper'

class GoalSalesControllerTest < ActionController::TestCase
  setup do
    @goal_sale = goal_sales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goal_sales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goal_sale" do
    assert_difference('GoalSale.count') do
      post :create, goal_sale: { alcanzado: @goal_sale.alcanzado, fechafin: @goal_sale.fechafin, fechainicio: @goal_sale.fechainicio, usuario_id: @goal_sale.usuario_id }
    end

    assert_redirected_to goal_sale_path(assigns(:goal_sale))
  end

  test "should show goal_sale" do
    get :show, id: @goal_sale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goal_sale
    assert_response :success
  end

  test "should update goal_sale" do
    patch :update, id: @goal_sale, goal_sale: { alcanzado: @goal_sale.alcanzado, fechafin: @goal_sale.fechafin, fechainicio: @goal_sale.fechainicio, usuario_id: @goal_sale.usuario_id }
    assert_redirected_to goal_sale_path(assigns(:goal_sale))
  end

  test "should destroy goal_sale" do
    assert_difference('GoalSale.count', -1) do
      delete :destroy, id: @goal_sale
    end

    assert_redirected_to goal_sales_path
  end
end
