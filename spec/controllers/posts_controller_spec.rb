require 'rails_helper'

RSpec.describe PostsController, type: :controller do

	describe "#index" do

		# ログインユーザーとして
		context "as login user" do

			before do
				@post = FactoryBot.create(:post)
				@user = @post.user
			end

			# 正常にレスポンスを返すこと
			it "responds successfully" do
				sign_in @user
				get :index
				expect(response).to be_success
			end

			# 200レスポンスを返すこと
			it "returns a 200 response" do
				sign_in @user
				get :index
				expect(response).to have_http_status "200"
			end
		end

		# ログインしていないユーザーとして
		context "as not logged in user" do

			before do
				@post = FactoryBot.create(:post)
			end

			# 302レスポンスを返すこと
			it "returns a 302 response" do
				get :index
				expect(response).to have_http_status "302"
			end

			# サインイン画面にリダイレクトすること
			it "redirects to the sign-in page" do
				get :index
				expect(response).to redirect_to "/users/sign_in"
			end
		end
	end

	describe "#new" do

		# ログインユーザーとして
		context "as login user" do

			before do
				@post = FactoryBot.create(:post)
				@user = @post.user
			end

			# 正常にレスポンスを返すこと
			it "responds successfully" do
				sign_in @user
				get :new
				expect(response).to be_success
			end

			# 200レスポンスを返すこと
			it "returns a 200 response" do
				sign_in @user
				get :new
				expect(response).to have_http_status "200"
			end
		end

		# ログインしていないユーザーとして
		context "as not logged in user" do

			before do
				@post = FactoryBot.create(:post)
			end

			# 302レスポンスを返すこと
			it "returns a 302 response" do
				get :new
				expect(response).to have_http_status "302"
			end

			# サインイン画面にリダイレクトすること
			it "redirects to the sign-in page" do
				get :new
				expect(response).to redirect_to "/users/sign_in"
			end
		end
	end

	describe "#show" do

		# ログインユーザーとして
		context "as login user" do

			# 自身の投稿
			context "my post" do

				before do
					@post = FactoryBot.create(:post)
					@user = @post.user
				end

				# 正常にレスポンスを返すこと
				it "responds successfully" do
					sign_in @user
					get :show, params: { id: @post.id }
					expect(response).to be_success
				end

				# 200レスポンスを返すこと
				it "returns a 200 response" do
					sign_in @user
					get :show, params: { id: @post.id }
					expect(response).to have_http_status "200"
				end
			end

			# 他のユーザーの投稿
			context "other user's post" do

				before do
					@user = FactoryBot.create(:user)
					@post = FactoryBot.create(:post)
					@other_user = @post.user
				end

				# 正常にレスポンスを返すこと
				it "responds successfully" do
					sign_in @user
					get :show, params: { id: @post.id }
					expect(response).to be_success
				end

				# 200レスポンスを返すこと
				it "returns a 200 response" do
					sign_in @user
					get :show, params: { id: @post.id }
					expect(response).to have_http_status "200"
				end
			end
		end

		# ログインしていないユーザーとして
		context "as not logged in user" do

			before do
				@post = FactoryBot.create(:post)
			end

			# 302レスポンスを返すこと
			it "returns a 302 response" do
				get :show, params: { id: @post.id }
				expect(response).to have_http_status "302"
			end

			# サインイン画面にリダイレクトすること
			it "redirects to the sign-in page" do
				get :show, params: { id: @post.id }
				expect(response).to redirect_to "/users/sign_in"
			end
		end
	end

	describe "#edit" do

		# ログインユーザーとして
		context "as login user" do

			# 自身の投稿
			context "my post" do

				before do
					@post = FactoryBot.create(:post)
					@user = @post.user
				end

				# 正常にレスポンスを返すこと
				it "responds successfully" do
					sign_in @user
					get :edit, params: { id: @post.id }
					expect(response).to be_success
				end

				# 200レスポンスを返すこと
				it "returns a 200 response" do
					sign_in @user
					get :edit, params: { id: @post.id }
					expect(response).to have_http_status "200"
				end
			end
		end

		# ログインしていないユーザーとして
		context "as not logged in user" do

			before do
				@post = FactoryBot.create(:post)
			end

			# 302レスポンスを返すこと
			it "returns a 302 response" do
				get :edit, params: { id: @post.id }
				expect(response).to have_http_status "302"
			end

			# サインイン画面にリダイレクトすること
			it "redirects to the sign-in page" do
				get :edit, params: { id: @post.id }
				expect(response).to redirect_to "/users/sign_in"
			end
		end
	end

	describe "#update" do

		# ログインユーザーとして
		context "as login user" do

			before do
				@post = FactoryBot.create(:post)
				@user = @post.user
			end

			# タイトルを更新できること
			it "updates a post" do
				post_params = FactoryBot.attributes_for(:post, title: "タイトル更新")
				sign_in @user
				patch :update, params: { id: @post.id, post: post_params }
				expect(@post.reload.title).to eq "タイトル更新"
			end
		end

		# ログインしていないユーザーとして
		context "as not logged in user" do

			before do
				@post = FactoryBot.create(:post)
				@other_user = @post.user
				@post_params = FactoryBot.attributes_for(:post, title: "名前更新テスト")
			end

			# 302レスポンスを返すこと
			it "returns a 302 response" do
				patch :update, params: { id: @post.id, post: @post_params }
				expect(response).to have_http_status "302"
			end

			# サインイン画面にリダイレクトすること
			it "redirects to the sign-in page" do
				patch :update, params: { id: @post.id, post: @post_params }
				expect(response).to redirect_to "/users/sign_in"
			end
		end
	end

	describe "#destroy" do

		# ログインユーザーとして
		context "as login user" do

			before do
				@post = FactoryBot.create(:post)
				@user = @post.user
			end

			# 自身の投稿を削除できること
			it "destroies my post" do
				sign_in @user
				expect {
					delete :destroy, params: { id: @post.id }
				}.to change(Post, :count).by(-1)
			end
		end

		# 管理者ユーザーとして
		context "as an admin user" do

			before do
				@post = FactoryBot.create(:post)
				@admin_user = FactoryBot.create(:user, admin: true)
			end

			# 他ユーザーの投稿
			it "destroies other user's post" do
				sign_in @admin_user
				expect {
					delete :destroy, params: { id: @post.id }
				}.to change(Post, :count).by(-1)
			end

			# リダイレクト先が投稿一覧画面であること
			it "redirects to the post-index page" do
				sign_in @admin_user
				delete :destroy, params: { id: @post.id }
				expect(response).to redirect_to "/posts"
			end
		end

		# ログインしていないユーザーとして
		context "as not logged in user" do

			before do
				@post = FactoryBot.create(:post)
			end

			# 302レスポンスを返すこと
			it "returns a 302 response" do
				delete :destroy, params: { id: @post.id }
				expect(response).to have_http_status "302"
			end

			# サインイン画面にリダイレクトすること
			it "redirects to the sign-in page" do
				delete :destroy, params: { id: @post.id }
				expect(response).to redirect_to "/users/sign_in"
			end
		end
	end

	describe "#search" do

		# 正常にレスポンスを返すこと
		it "responds successfully" do
			get :search
			expect(response).to be_success
		end

		# 200レスポンスを返すこと
		it "returns a 200 response" do
			get :search
			expect(response).to have_http_status "200"
		end
	end
end
