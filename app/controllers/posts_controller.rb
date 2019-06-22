class PostsController < ApplicationController
  before_action :authenticate_user, only: %i[create]

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(content: params[:post][:content])
    @post.user = current_user
    @post.elem = Elem.find(params[:elem_id])
    if @post.save
      redirect_to lang_elem_path(@post.elem.lang, @post.elem), success: "投稿に成功しました"
    else
      redirect_to lang_elem_path(@post.elem.lang, @post.elem), danger: "投稿に失敗しました"
    end
  end
end
