# coding: utf-8

class Admin::TopController < Admin::Base

  def index
  end

  def not_found
    raise ActionController::RoutingError,
          "No route matches #{request.path.inspect}"
  end

end
