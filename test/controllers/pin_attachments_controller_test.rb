require 'test_helper'

class PinAttachmentsControllerTest < ActionController::TestCase
  setup do
    @pin_attachment = pin_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pin_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pin_attachment" do
    assert_difference('PinAttachment.count') do
      post :create, pin_attachment: { pictures: @pin_attachment.pictures, pin_id: @pin_attachment.pin_id }
    end

    assert_redirected_to pin_attachment_path(assigns(:pin_attachment))
  end

  test "should show pin_attachment" do
    get :show, id: @pin_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pin_attachment
    assert_response :success
  end

  test "should update pin_attachment" do
    patch :update, id: @pin_attachment, pin_attachment: { pictures: @pin_attachment.pictures, pin_id: @pin_attachment.pin_id }
    assert_redirected_to pin_attachment_path(assigns(:pin_attachment))
  end

  test "should destroy pin_attachment" do
    assert_difference('PinAttachment.count', -1) do
      delete :destroy, id: @pin_attachment
    end

    assert_redirected_to pin_attachments_path
  end
end
