class RecordsController < ApplicationController
  def index
  end

  def new
    @record = Record.new
    @record.record_elems.build
  end

  def create
    @record = Record.new(record_params)
    @record.user = current_user
    if @record.save
      redirect_to record_path(@record)
    else
      render 'new'
    end
  end

  def show
  end

  private
  def record_params
    params.require(:record).permit(:r_date, :comment, record_elems_attributes:[:elem_id])
  end
end
