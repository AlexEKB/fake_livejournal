require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :text }

  it { should have_many(:comments).dependent(:destroy) }

  it { should belong_to(:user) }
  it { should validate_presence_of :user }

  context "posts" do
    let(:user) { FactoryBot.create :user }
    #let(:post) { FactoryBot.create :post, user: user }

    describe "#create_post" do
      it "creates post for user" do
        expect { User.create_post(post).to change(Post, :count).by(1) }
      end
    end

    describe "#destroy_post" do
      it "destroys post" do
        expect { User.destroy_post(post).to change(Post, :count).by(-1) }
      end
    end
  end
end
