require 'test_helper'

class PromotionsControllerTest < ActionController::TestCase
  setup do
    @promotion = promotions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:promotions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create promotion" do
    assert_difference('Promotion.count') do
      post :create, promotion: { acuerdo: @promotion.acuerdo, client_id: @promotion.client_id, descripcion: @promotion.descripcion, medio: @promotion.medio, usuario_id: @promotion.usuario_id }
    end

    assert_redirected_to promotion_path(assigns(:promotion))
  end

  test "should show promotion" do
    get :show, id: @promotion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @promotion
    assert_response :success
  end

  test "should update promotion" do
    patch :update, id: @promotion, promotion: { acuerdo: @promotion.acuerdo, client_id: @promotion.client_id, descripcion: @promotion.descripcion, medio: @promotion.medio, usuario_id: @promotion.usuario_id }
    assert_redirected_to promotion_path(assigns(:promotion))
  end

  test "should destroy promotion" do
    assert_difference('Promotion.count', -1) do
      delete :destroy, id: @promotion
    end

    assert_redirected_to promotions_path
  end
end
