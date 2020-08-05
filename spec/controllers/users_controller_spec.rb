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

	describe "#update" do

		# 認可されたユーザーとして
		context "as an authorized user" do

			before do
				@user = FactoryBot.create(:user)
			end

			# プロフィールを更新できること
			it "updates a profile" do
				user_params = FactoryBot.attributes_for(:user, name: "名前更新テスト")
				sign_in @user
				patch :update, params: { id: @user.id, user: user_params }
				expect(@user.reload.name).to eq "名前更新テスト"
			end
		end

		# ログインしていないユーザーとして
		context "as not logged in user" do

			before do
				@other_user = FactoryBot.create(:user)
				@user_params = FactoryBot.attributes_for(:user, name: "名前更新テスト")
			end

			# 302レスポンスを返すこと
			it "returns a 302 response" do
				patch :update, params: { id: @other_user.id, user: @user_params }
				expect(response).to have_http_status "302"
			end

			# サインイン画面にリダイレクトすること
			it "redirects to the sign-in page" do
				patch :update, params: { id: @other_user.id, user: @user_params }
				expect(response).to redirect_to "/users/sign_in"
			end
		end
	end

	describe "#destroy" do

		# 管理者ユーザーとして
		context "as an admin user" do

			before do
				@admin_user = FactoryBot.create(:user, admin: true)
			end

			# 一般ユーザーを対象
			context "to a general user" do

				# 一般ユーザーを削除できること
				it "destroies a general user" do
					user = FactoryBot.create(:user)
					sign_in @admin_user
					expect {
						delete :destroy, params: { id: user.id }
					}.to change(User, :count).by(-1)
				end
			end

			# ゲストユーザーを対象
			context "to a guest user" do

				# ゲストユーザーを削除できないこと
				it "does not destroy a guest user" do
					guest_user = FactoryBot.create(:user, email: "guest_user@gmail.com")
					sign_in @admin_user
					expect {
						delete :destroy, params: { id: guest_user }
					}.to change(User, :count).by(0)
				end

				# 投稿一覧画面にリダイレクトすること
				it "redirects to the post-index page" do
					guest_user = FactoryBot.create(:user, email: "guest_user@gmail.com")
					sign_in @admin_user
					delete :destroy, params: { id: guest_user }
					expect(response).to redirect_to "/posts"
				end
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
