class Api::CheckInsController < ApplicationController
  #before_action :authenticate

  def index
    check_ins = CheckIn.joins("join icecream_shops on check_ins.shop_id = icecream_shops.id")
      .where(user_id: current_user.id)
      .select("check_ins.id, check_ins.created_at, icecream_shops.name AS shop_name")

    # group the json by

    uniq_check_in_dates = check_ins.group_by{ |c| c.created_at.to_date }

    @check_in_count = []

    uniq_check_in_dates.each do |date, stores|
      count = stores.length
      @check_in_count << {date: date, count: count, stores: stores }
    end

    render json: @check_in_count, status: 201
  end

end
