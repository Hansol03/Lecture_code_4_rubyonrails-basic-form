class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    # render 'posts/new' 이름이 같으므로 생략가능 controller  와 view 의 파일명이 같다 
  end
  
  def create
    Post.create(
      title: params[:title],
      content: params[:content]
      )
      redirect_to '/'
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    # /posts/update/1 => 1번 id를 가진 Post내용을 수정하겠다. 
    @post = Post.find(params[:id])
    @post.update(
      title: params[:title],
      content: params[:content]
      )
      redirect_to "/posts/show/#{@post.id}"
  end
  #show와 edit 의 내용물이 같다. 
end
