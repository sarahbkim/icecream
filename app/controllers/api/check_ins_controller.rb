class Api::CheckInsController < ApplicationController
  #before_action :authenticate

  def index
    @check_ins = CheckIn.where(user_id: current_user.id).to_a
    render json: @check_ins, status: 201
  end

end
