class CommentsController < ApplicationController
  before_action :set_post
  def new
    # @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    # "comment"=>{"content"=>"HERE IS MY FIRST COMMENT!!"}, "commit"=>"Create Comment", "controller"=>"comments", "action"=>"create", "post_id"=>"4"}
     # @post = Post.find(params[:post_id])
     @comment = @post.comments.build(comment_params)
     if @comment.save
      redirect_to @post
    else
      render :new
    end
  end

  def show
    # @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = @post.comments.find(params[:id])
    @comment.update(comment_params)
    redirect_to @post
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
