class LangsController < ApplicationController
  before_action :authenticate_user, only: %i[new create edit update destroy]
  before_action :admin_user, only: %i[edit update destroy]

  def index
    h = Hash.new
    Lang.all.each do |lang|
      l_users = []
      RecordElem.all.each do |re|
        if re.elem.lang == lang
          l_users.push(re.record.user.id)
        end
      end
      h[lang.id] = l_users.uniq.count
    end
    @langs = h.sort_by{ |_, v| -v }
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

    h = Hash.new
    Elem.where(lang_id: params[:id]).each do |e|
      e_users = []
      RecordElem.where(elem_id: e.id).each do |re|
        e_users.push(re.record.user.id)
      end
      h[e.id] = e_users.uniq.count
    end
    puts h
    @elems_sorted = h.sort_by{ |_, v| -v }
    puts @elems_sorted
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
    params.require(:lang).permit(:name)
  end
end
