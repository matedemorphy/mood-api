require "test_helper"

class MoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mood = moods(:one)
  end

  test "should get index" do
    get moods_url, as: :json
    assert_response :success
  end

  test "should create mood" do
    assert_difference("Mood.count") do
      post moods_url, params: { mood: { emoji: @mood.emoji, name: @mood.name, reason: @mood.reason } }, as: :json
    end

    assert_response :created
  end

  test "should show mood" do
    get mood_url(@mood), as: :json
    assert_response :success
  end

  test "should update mood" do
    patch mood_url(@mood), params: { mood: { emoji: @mood.emoji, name: @mood.name, reason: @mood.reason } }, as: :json
    assert_response :success
  end

  test "should destroy mood" do
    assert_difference("Mood.count", -1) do
      delete mood_url(@mood), as: :json
    end

    assert_response :no_content
  end
end
