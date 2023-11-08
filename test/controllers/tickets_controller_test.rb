# frozen_string_literal: true

class TicketsControllerTest < ActionController::TestCase
  setup do
    @ticket = tickets(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:tickets)
  end

  test 'should get show' do
    get :show, params: { id: @ticket.id }
    assert_response :success
    assert_not_nil assigns(:ticket)
  end
end
