class PostsController < ApplicationController

  def new
    @post = Post.new
    @place = Place.find_by({ "id" => params["place_id"] })
    @post["place_id"] = @place["id"]
  end

  def create
    @post = Post.new
    @post["activity"] = params["post"]["activity"]
    @post["posted_on"] = params["post"]["posted_on"]
    @post.save
    redirect_to "/places/#{@post["place_id"]}"
  end
end
