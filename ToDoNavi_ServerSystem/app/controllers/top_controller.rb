# coding: utf-8
class TopController < ApplicationController

  def index
  end

  def login
  end

  def datasearch
  end

  def not_found
    raise ActionController::RoutingError,
          "No route matches #{request.path.inspect}"
  end

end
