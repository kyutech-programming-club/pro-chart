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
      redirect_to @lang, success: "言語登録に成功しました"
    else
      render :new
    end
  end

  def show
    @lang = Lang.find(params[:id])
    @elems = @lang.elems
  end

  private

  def lang_params
    params.required(:lang).permit(:name)
  end
end
