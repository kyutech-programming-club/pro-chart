class ElemsController < ApplicationController
  before_action :authenticate_user, only: %i[new create edit update destroy]
  before_action :admin_user, only: %i[edit update destroy]

  def new
    @elem = Elem.new
  end

  def create
    lang = Lang.find(params[:lang_id])
    @elem = lang.elems.build(elem_params)
    if @elem.save
      redirect_to langs_path, success: "要素の登録に成功しました"
    else
      render :new
    end
  end

  def show
    @elem = Elem.find(params[:id])
    users = []
    RecordElem.where(elem_id: @elem.id).each do |re|
      users.push(re.record.user.name)
    end
    users.uniq!
    puts users
    @elem_users = []
    users.each do |user|
      @elem_users.push(User.find_by(name: user))
    end
  end

  def destroy
    Elem.find(params[:id]).destroy
    redirect_to lang_path(params[:lang_id]), success: "削除完了"
  end

  def edit
    @elem = Elem.find(params[:id])
  end

  def update
    @elem = Elem.find(params[:id])
    if @elem.update(elem_params)
      redirect_to lang_elem_path(@elem.lang, @elem), success: "編集完了"
    else
      render :edit
    end
  end

  private

  def elem_params
    params.require(:elem).permit(:name)
  end
end
