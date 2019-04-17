require "application_system_test_case"

class EventRegistersTest < ApplicationSystemTestCase
  setup do
    @event_register = event_registers(:one)
  end

  test "visiting the index" do
    visit event_registers_url
    assert_selector "h1", text: "Event Registers"
  end

  test "creating a Event register" do
    visit event_registers_url
    click_on "New Event Register"

    fill_in "Email", with: @event_register.email
    fill_in "Eventid", with: @event_register.eventId
    fill_in "Firtsname", with: @event_register.firtsName
    fill_in "Lastname", with: @event_register.lastName
    fill_in "Nickname", with: @event_register.nickName
    click_on "Create Event register"

    assert_text "Event register was successfully created"
    click_on "Back"
  end

  test "updating a Event register" do
    visit event_registers_url
    click_on "Edit", match: :first

    fill_in "Email", with: @event_register.email
    fill_in "Eventid", with: @event_register.eventId
    fill_in "Firtsname", with: @event_register.firtsName
    fill_in "Lastname", with: @event_register.lastName
    fill_in "Nickname", with: @event_register.nickName
    click_on "Update Event register"

    assert_text "Event register was successfully updated"
    click_on "Back"
  end

  test "destroying a Event register" do
    visit event_registers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event register was successfully destroyed"
  end
end
