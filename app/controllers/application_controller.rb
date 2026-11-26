class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  # Step1 - add pagy to controller
  include Pagy::Method

  before_action :set_paper_trail_whodunnit
  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit

  private

  def require_admin!
    unless current_user&.admin?
      redirect_to root_path, alert: "Access denied. Admin privileges required."
    end
  end

  def require_teacher_or_admin!
    unless current_user&.teacher? || current_user&.admin?
      redirect_to root_path, alert: "Access denied. Teacher or Admin privileges required."
    end
  end
end
