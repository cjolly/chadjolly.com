class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # https://github.com/roidrage/lograge
  def append_info_to_payload(payload)
    super
    payload[:request_id] = request.uuid
  end

end
