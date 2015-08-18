require 'test_helper'

class ContentAttachmentsControllerTest < ActionController::TestCase
  setup do
    @content_attachment = content_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_attachment" do
    assert_difference('ContentAttachment.count') do
      post :create, content_attachment: { content_id: @content_attachment.content_id, created: @content_attachment.created, image: @content_attachment.image }
    end

    assert_redirected_to content_attachment_path(assigns(:content_attachment))
  end

  test "should show content_attachment" do
    get :show, id: @content_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @content_attachment
    assert_response :success
  end

  test "should update content_attachment" do
    patch :update, id: @content_attachment, content_attachment: { content_id: @content_attachment.content_id, created: @content_attachment.created, image: @content_attachment.image }
    assert_redirected_to content_attachment_path(assigns(:content_attachment))
  end

  test "should destroy content_attachment" do
    assert_difference('ContentAttachment.count', -1) do
      delete :destroy, id: @content_attachment
    end

    assert_redirected_to content_attachments_path
  end
end
