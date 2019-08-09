class NCafeController < ApplicationController
  def index
    @data_list = Market.all
  end
end
