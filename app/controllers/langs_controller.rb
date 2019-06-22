class LangsController < ApplicationController
  def index
    @langs = Lang.all
  end

  def new
    @lang = Lang.new
  end

  def create
    @lang = Lang.new(lang_params)
    if @lang.save
      redirect_to @lang
    else
      render :new
    end
  end

  def show
    @lang = Lang.find(params[:id])
  end

  private

  def lang_params
    params.required(:lang).permit(:name)
  end
end
