class ElemsController < ApplicationController

  def new
    @elem = Elem.new
  end

  def create
    lang = Lang.find(params[:lang_id])
    @elem = lang.elems.build(elem_params)
    if @elem.save
      redirect_to root_path, success: "要素の登録に成功しました"
    else
      render :new
    end
  end

  def show
    @elem = Elem.find(params[:id])
  end

  private

  def elem_params
    params.required(:elem).permit(:name, :references)
  end
end
