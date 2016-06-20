require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message = messages(:one)
  end

  test "should get index" do
    get messages_url
    assert_response :success
  end

  test "should get new" do
    get new_message_url
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count') do
      post messages_url, params: { message: { message: @message.message, read: @message.read, receiver_id: @message.receiver_id, sender_id: @message.sender_id, subject: @message.subject } }
    end

    assert_redirected_to message_path(Message.last)
  end

  test "should show message" do
    get message_url(@message)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_url(@message)
    assert_response :success
  end

  test "should update message" do
    patch message_url(@message), params: { message: { message: @message.message, read: @message.read, receiver_id: @message.receiver_id, sender_id: @message.sender_id, subject: @message.subject } }
    assert_redirected_to message_path(@message)
  end

  test "should destroy message" do
    assert_difference('Message.count', -1) do
      delete message_url(@message)
    end

    assert_redirected_to messages_path
  end
end
