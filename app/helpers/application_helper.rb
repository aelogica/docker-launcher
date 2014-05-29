module ApplicationHelper
  def currently_active_page?(path)
    'active' if current_page?(path)
  end
end
