class NotificationsController < ApplicationController
  def index
    # Kunin ang Noticed::Event para iisa lang ang lumitaw sa bawat student creation
    @notifications = Noticed::Event.order(created_at: :desc).limit(20)
  end
end