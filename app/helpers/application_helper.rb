module ApplicationHelper

  def remove_navbar?(fullpath)
    false
  end

  def is_root_path?
    request.fullpath == '/'
  end

  def is_blog_path?
    request.fullpath.start_with?('/articles')
  end

  def is_admin_path?
    request.fullpath.start_with?('/admin')
  end
end
