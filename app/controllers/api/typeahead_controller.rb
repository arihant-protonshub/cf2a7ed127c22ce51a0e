class Api::TypeaheadController < ApplicationController

  def search
    users = User.where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ?", "%#{params[:input]}%", "%#{params[:input]}%", "%#{params[:input]}%")
    response = users.map {|user| "#{user.first_name} #{user.last_name}"}.to_sentence
    render json: response
  end
end
