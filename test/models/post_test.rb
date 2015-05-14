require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @post = Post.new(title: "Post")
  end

  test "regular serialization" do
    serializer = PostSerializer.new(@post)
    assert_equal "Post", serializer.as_json["object"]["title"]
  end

  test "serialize post with double title" do
    post_with_double_title = PostWithDoubleTitle.new(@post)
    serializer = PostSerializer.new(post_with_double_title)

    assert_equal "PostPost", post_with_double_title.title, "The delegator did not double the title"
    assert_equal "PostPost", serializer.as_json["object"]["title"], "The serializer did not double the title"
  end
end
