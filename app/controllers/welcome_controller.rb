class WelcomeController < ApplicationController
  def index
    session[:conversations] ||= []

    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:receiver, :messages)
                                 .find(session[:conversations])
  end
end
