class Api::TypeheadController < ApplicationController

  def search
    users = User.where("first_name ILIKE '%?%' OR last_name ILIKE '%?%' OR email ILIKE '%?%'", params[:input], params[:input] , params[:input])
    response = users.map {|user| "#{user.first_name} #{user.last_name}"}.to_sentence
    render json: response
  end
end
