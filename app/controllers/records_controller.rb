class RecordsController < ApplicationController
  before_action :recomend_user, only: %i[new]
  before_action :authenticate_user, only: %i[create edit update]


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
      if params[:group]
        elems = params[:group][:elem_ids].map{|s| s.to_i}
        elems.each do |e|
          re = RecordElem.new(record_id: @record.id, elem_id: e)
          re.save
        end
      end
      params[:elem].each do |n|
        unless n[1].blank?
          new_elem = Elem.new(lang_id: n[0].first.to_i, name: n[1])
          new_elem.save
          n_re = RecordElem.new(record_id: @record.id, elem_id: new_elem.id)
          n_re.save
        end
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
