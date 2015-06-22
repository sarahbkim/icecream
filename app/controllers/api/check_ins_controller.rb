class Api::CheckInsController < ApplicationController
  #before_action :authenticate

  def index
    @data = {}

    check_ins = CheckIn.joins("join icecream_shops on check_ins.shop_id = icecream_shops.id")
      .where(user_id: current_user.id)
      .select("check_ins.id, check_ins.created_at, icecream_shops.name AS shop_name")

    # group the json by

    uniq_check_in_dates = check_ins.group_by{ |c| c.created_at.to_date }
    uniq_check_in_shops = check_ins.group_by { |c| c.shop_name }

    @check_in_count_by_date = []
    @check_in_count_by_shop = []

    uniq_check_in_dates.each do |date, stores|
      count = stores.length
      @check_in_count_by_date << {date: date, count: count, stores: stores }
    end

    uniq_check_in_shops.each do |shop, dates|
      count = dates.length
      @check_in_count_by_shop << {shop: shop, count: count}
    end


    @data['by_date'] = @check_in_count_by_date
    @data['by_shop'] = @check_in_count_by_shop

    render json: @data, status: 201
  end

end
