module ApplicationHelper

  def is_admin?
    self.admin == current_user.id
  end
end
