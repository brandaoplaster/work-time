require "application_system_test_case"

class RecordTimesTest < ApplicationSystemTestCase
  setup do
    @record_time = record_times(:one)
  end

  test "visiting the index" do
    visit record_times_url
    assert_selector "h1", text: "Record Times"
  end

  test "creating a Record time" do
    visit record_times_url
    click_on "New Record Time"

    fill_in "Time stamp", with: @record_time.time_stamp
    fill_in "Weekday", with: @record_time.weekday_id
    click_on "Create Record time"

    assert_text "Record time was successfully created"
    click_on "Back"
  end

  test "updating a Record time" do
    visit record_times_url
    click_on "Edit", match: :first

    fill_in "Time stamp", with: @record_time.time_stamp
    fill_in "Weekday", with: @record_time.weekday_id
    click_on "Update Record time"

    assert_text "Record time was successfully updated"
    click_on "Back"
  end

  test "destroying a Record time" do
    visit record_times_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Record time was successfully destroyed"
  end
end
