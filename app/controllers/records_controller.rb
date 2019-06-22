class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def new
    @record = Record.new
    @langs = Lang.all
  end

  def create
    @record = Record.new(record_params)
    @record.user = current_user
    if @record.save
      elems = params[:group][:elem_ids].map{|s| s.to_i}
      elems.each do |e|
        re = RecordElem.new(record_id: @record.id, elem_id: e)
        re.save
      end
      redirect_to record_path(@record)
    else
      render :new
    end
  end

  def show
    @record = Record.find(params[:id])
  end

  private
  def record_params
    params.require(:record).permit(:r_date, :comment)
  end
end
