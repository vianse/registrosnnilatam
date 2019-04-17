require 'test_helper'

class EventRegistersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_register = event_registers(:one)
  end

  test "should get index" do
    get event_registers_url
    assert_response :success
  end

  test "should get new" do
    get new_event_register_url
    assert_response :success
  end

  test "should create event_register" do
    assert_difference('EventRegister.count') do
      post event_registers_url, params: { event_register: { email: @event_register.email, eventId: @event_register.eventId, firtsName: @event_register.firtsName, lastName: @event_register.lastName, nickName: @event_register.nickName } }
    end

    assert_redirected_to event_register_url(EventRegister.last)
  end

  test "should show event_register" do
    get event_register_url(@event_register)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_register_url(@event_register)
    assert_response :success
  end

  test "should update event_register" do
    patch event_register_url(@event_register), params: { event_register: { email: @event_register.email, eventId: @event_register.eventId, firtsName: @event_register.firtsName, lastName: @event_register.lastName, nickName: @event_register.nickName } }
    assert_redirected_to event_register_url(@event_register)
  end

  test "should destroy event_register" do
    assert_difference('EventRegister.count', -1) do
      delete event_register_url(@event_register)
    end

    assert_redirected_to event_registers_url
  end
end
