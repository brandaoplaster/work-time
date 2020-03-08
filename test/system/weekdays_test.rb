require "application_system_test_case"

class WeekdaysTest < ApplicationSystemTestCase
  setup do
    @weekday = weekdays(:one)
  end

  test "visiting the index" do
    visit weekdays_url
    assert_selector "h1", text: "Weekdays"
  end

  test "creating a Weekday" do
    visit weekdays_url
    click_on "New Weekday"

    fill_in "Current day", with: @weekday.current_day
    click_on "Create Weekday"

    assert_text "Weekday was successfully created"
    click_on "Back"
  end

  test "updating a Weekday" do
    visit weekdays_url
    click_on "Edit", match: :first

    fill_in "Current day", with: @weekday.current_day
    click_on "Update Weekday"

    assert_text "Weekday was successfully updated"
    click_on "Back"
  end

  test "destroying a Weekday" do
    visit weekdays_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Weekday was successfully destroyed"
  end
end
