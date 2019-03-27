class HashtagsController < ApplicationController
  expose :hashtag, find_by: :name
  expose :posts
end
