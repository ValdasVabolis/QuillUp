require 'test_helper'

class Users::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_post = users_posts(:one)
  end

  test "should get index" do
    get users_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_users_post_url
    assert_response :success
  end

  test "should create users_post" do
    assert_difference('Users::Post.count') do
      post users_posts_url, params: { users_post: { body: @users_post.body, title: @users_post.title, user_id: @users_post.user_id } }
    end

    assert_redirected_to users_post_url(Users::Post.last)
  end

  test "should show users_post" do
    get users_post_url(@users_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_post_url(@users_post)
    assert_response :success
  end

  test "should update users_post" do
    patch users_post_url(@users_post), params: { users_post: { body: @users_post.body, title: @users_post.title, user_id: @users_post.user_id } }
    assert_redirected_to users_post_url(@users_post)
  end

  test "should destroy users_post" do
    assert_difference('Users::Post.count', -1) do
      delete users_post_url(@users_post)
    end

    assert_redirected_to users_posts_url
  end
end
