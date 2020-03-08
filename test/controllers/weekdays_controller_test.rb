require 'test_helper'

class WeekdaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weekday = weekdays(:one)
  end

  test "should get index" do
    get weekdays_url
    assert_response :success
  end

  test "should get new" do
    get new_weekday_url
    assert_response :success
  end

  test "should create weekday" do
    assert_difference('Weekday.count') do
      post weekdays_url, params: { weekday: { current_day: @weekday.current_day } }
    end

    assert_redirected_to weekday_url(Weekday.last)
  end

  test "should show weekday" do
    get weekday_url(@weekday)
    assert_response :success
  end

  test "should get edit" do
    get edit_weekday_url(@weekday)
    assert_response :success
  end

  test "should update weekday" do
    patch weekday_url(@weekday), params: { weekday: { current_day: @weekday.current_day } }
    assert_redirected_to weekday_url(@weekday)
  end

  test "should destroy weekday" do
    assert_difference('Weekday.count', -1) do
      delete weekday_url(@weekday)
    end

    assert_redirected_to weekdays_url
  end
end
