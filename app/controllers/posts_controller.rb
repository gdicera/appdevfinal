class PostsController < ApplicationController
  def index
    @list_of_posts = Post.all.order({ :created_at => :desc })
    render({ :template => "posts/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @the_post = Post.where({ :id => the_id }).at(0)

    @list_of_posts = @topic.posts

    render({ :template => "posts/show.html.erb" })
  end

  def create
    the_topic = Topic.new
    the_topic.user_id = session.fetch(:user_id)
    
    the_post = Post.new
    the_post.user_id = session.fetch(:user_id)
    #the_post.the_topic.id = params.fetch(:topic_id)
    the_post.body = params.fetch("input_body")

    if the_post.valid?
      the_post.save
      redirect_to("/topics/#{the_topic.id}", { :notice => "Post created successfully." })
    else
      redirect_to("/topics/#{the_topic.id}", { :alert => the_post.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_post = Post.where({ :id => the_id }).at(0)

    the_post.user_id = params.fetch("query_user_id")
    #the_post.topic_id = params.fetch("query_topic_id")
    the_post.body = params.fetch("input_body")

    if the_post.valid?
      the_post.save
      redirect_to("/topics/#{the_topic.id}", { :notice => "Post updated successfully."} )
    else
      redirect_to("/topics/#{the_topic.id}", { :alert => the_post.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_post = Post.where({ :id => the_id }).at(0)

    the_post.destroy

    redirect_to("/topics", { :notice => "Post deleted successfully."} )
  end
end
