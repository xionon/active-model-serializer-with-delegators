class PostWithDoubleTitle < SimpleDelegator
  def title
    super * 2
  end
end
