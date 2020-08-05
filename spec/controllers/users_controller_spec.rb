require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	describe "#index" do

		before do
			@user = FactoryBot.create(:user)
		end

		# 正常にレスポンスを返すこと
		it "responds successfully" do
			get :index
			expect(response).to be_success
		end

		# 200レスポンスを返すこと
		it "returns a 200 response" do
			get :index
			expect(response).to have_http_status "200"
		end
	end

	describe "#show" do

		# 認可されたユーザーとして
		context "as an authorized user" do

			before do
				@user = FactoryBot.create(:user)
			end

			# 正常にレスポンスを返すこと
			it "responds successfully" do
				sign_in @user
				get :show, params: { id: @user.id }
				expect(response).to be_success
			end

			# 200レスポンスを返すこと
			it "returns a 200 response" do
				sign_in @user
				get :show, params: { id: @user.id }
				expect(response).to have_http_status "200"
			end
		end

		# 認可されていないユーザーとして
		context "as an unauthorized user" do

			before do
				@user = FactoryBot.create(:user)
				@other_user = FactoryBot.create(:user)
			end

			# 正常にレスポンスを返すこと
			it "responds successfully" do
				sign_in @user
				get :show, params: { id: @other_user.id }
				expect(response).to be_success
			end

			# 200レスポンスを返すこと
			it "returns a 200 response" do
				sign_in @user
				get :show, params: { id: @other_user.id }
				expect(response).to have_http_status "200"
			end
		end

		# ログインしていないユーザーとして
		context "as not logged in user" do

			before do
				@other_user = FactoryBot.create(:user)
			end

			# 302レスポンスを返すこと
			it "returns a 302 response" do
				get :show, params: { id: @other_user.id }
				expect(response).to have_http_status "302"
			end

			# サインイン画面にリダイレクトすること
			it "redirects to the sign-in page" do
				get :show, params: { id: @other_user.id }
				expect(response).to redirect_to "/users/sign_in"
			end
		end
	end

	describe "#edit" do

		# 認可されたユーザーとして
		context "as an authorized user" do

			before do
				@user = FactoryBot.create(:user)
			end

			# 正常にレスポンスを返すこと
			it "responds successfully" do
				sign_in @user
				get :edit, params: { id: @user.id }
				expect(response).to be_success
			end

			# 200レスポンスを返すこと
			it "returns a 200 response" do
				sign_in @user
				get :edit, params: { id: @user.id }
				expect(response).to have_http_status "200"
			end
		end

		# 管理者ユーザーとして
		context "as an admin user" do

			before do
				@admin_user = FactoryBot.create(:user, admin: true)
			end

			# ユーザー一覧画面にリダイレクトすること
			it "redirects to the user-index page" do
				sign_in @admin_user
				get :edit, params: { id: @admin_user.id }
				expect(response).to redirect_to "/users"
			end
		end

		# ログインしていないユーザーとして
		context "as not logged in user" do

			before do
				@other_user = FactoryBot.create(:user)
			end

			# 302レスポンスを返すこと
			it "returns a 302 response" do
				get :edit, params: { id: @other_user.id }
				expect(response).to have_http_status "302"
			end

			# サインイン画面にリダイレクトすること
			it "redirects to the sign-in page" do
				get :edit, params: { id: @other_user.id }
				expect(response).to redirect_to "/users/sign_in"
			end
		end
	end

	describe "#search" do

		before do
			@user = FactoryBot.create(:user)
		end

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
