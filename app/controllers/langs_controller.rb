class LangsController < ApplicationController
  before_action :authenticate_user, only: %i[new create]

  def index
    @langs = Lang.all
  end

  def new
    @lang = Lang.new
  end

  def create
    @lang = Lang.new(lang_params)
    if @lang.save
      redirect_to new_lang_elem_path(@lang), success: "言語登録に成功しました"
    else
      render :new
    end
  end

  def show
    @lang = Lang.find(params[:id])
    @elems = @lang.elems
  end

  def destroy
    Lang.find(params[:id]).destroy
    redirect_to langs_path, success: "削除完了"
  end

  def edit
    @lang = Lang.find(params[:id])
  end

  def update
    @lang = Lang.find(params[:id])
    if @lang.update(lang_params)
      redirect_to langs_path, success: "編集完了"
    else
      render :edit
    end
  end

  private

  def lang_params
    params.required(:lang).permit(:name)
  end
end
