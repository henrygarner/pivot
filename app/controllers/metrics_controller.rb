class MetricsController < ApplicationController
  def index
  end

  def show
  	@metric = Metric.find params[:id]
  end

end
