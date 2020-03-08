require 'test_helper'

class RecordTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @record_time = record_times(:one)
  end

  test "should get index" do
    get record_times_url
    assert_response :success
  end

  test "should get new" do
    get new_record_time_url
    assert_response :success
  end

  test "should create record_time" do
    assert_difference('RecordTime.count') do
      post record_times_url, params: { record_time: { time_stamp: @record_time.time_stamp, weekday_id: @record_time.weekday_id } }
    end

    assert_redirected_to record_time_url(RecordTime.last)
  end

  test "should show record_time" do
    get record_time_url(@record_time)
    assert_response :success
  end

  test "should get edit" do
    get edit_record_time_url(@record_time)
    assert_response :success
  end

  test "should update record_time" do
    patch record_time_url(@record_time), params: { record_time: { time_stamp: @record_time.time_stamp, weekday_id: @record_time.weekday_id } }
    assert_redirected_to record_time_url(@record_time)
  end

  test "should destroy record_time" do
    assert_difference('RecordTime.count', -1) do
      delete record_time_url(@record_time)
    end

    assert_redirected_to record_times_url
  end
end
