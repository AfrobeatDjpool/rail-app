module ApplicationHelper
	def current_class?(test_path)
    return 'active' if request.path == test_path
    ''
  end

  def flash_class(level)
    case level
    when 'notice' then "alert alert-info"
    when 'success' then "alert alert-success"
    when 'error' then "alert alert-error"
    when 'alert' then "alert alert-error"
    end
  end
end
