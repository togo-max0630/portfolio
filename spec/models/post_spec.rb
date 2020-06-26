require 'rails_helper'

RSpec.describe Post, type: :model do

    context "データが正しく保存される" do
        before do
            @post = Post.new
            @post.user_id =  1
            @post.title = "Hello WebCamp"
            @post.body = "今日も晴れです。"
            @post.category_id = 1
            @post.sub_category_id = 1
            @post.save
        end
        it "全て入力してあるので保存される" do
            expect(@post).to be_valid
        end
    end
end