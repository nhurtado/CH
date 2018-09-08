class HomeController < ApplicationController
  def index
    @ufs = DateValue.where('extract(year from date_v) = ?', 1984).to_json
  end
end
