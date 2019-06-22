class RecordsController < ApplicationController
  def index
  end

  def new
    @record = Record.new
  end

  def create
    puts params[:group][:elem_ids].map{|s| s.to_i}
    @record = Record.new(record_params)
    @record.user = current_user
    # @record.record_elems.elem = Elem.find(params[:record][:record_elems_attributes]["0"]["elem_id"].map{|s| s.to_i})
    if @record.save
      elems = params[:group][:elem_ids].map{|s| s.to_i}
      elems.each do |e|
        re = RecordElem.new(record_id: @record.id, elem_id: e)
        re.save
      end
      redirect_to record_path(@record)
    else
      render 'new'
    end
  end

  def show
  end

  private
  def record_params
    params.require(:record).permit(:r_date, :comment)
  end

  def elem_params
    params.require(:group).permit(elem_ids: [])
  end
end
