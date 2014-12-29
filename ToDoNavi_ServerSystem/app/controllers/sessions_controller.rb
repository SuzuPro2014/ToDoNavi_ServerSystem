# coding: utf-8
class SessionsController < ApplicationController

  def create
    user = Adminuser.authenticate(params[:user], params[:password])
    if user
      Adminuser.where(:user => user).find_each do |admin|
        @userID = admin.id
      end
      session[:adminuser_id] = @userID
    else
      flash.alert = "ユーザ名とパスワードが一致しません"
    end
    redirect_to :admin_root || params[:form]
  end

  def destroy
    session.delete(:adminuser_id)
    redirect_to :root
  end
  
end
