class CheckInsController < ApplicationController
  def index
    @user = current_user
    @check_ins = CheckIn.where(user_id: @user.id).to_a
  end

  def show
  end

  def new
    @check_in = CheckIn.new
  end

  def create
    @user = current_user
    @check_in = CheckIn.new(check_in_params)
  end

  def check_in

  end

  private
    def check_in_params
      params.require(:check_in).permit(:user_id, :shop_id, :factual_id)
    end
end
