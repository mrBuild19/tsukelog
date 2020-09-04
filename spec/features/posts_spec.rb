require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  feature 'Check Post' do
    background do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post,
                                user_id: @user.id,
                                title: "おいしいつけ麺",
                                text: "これはテストです。",
                                rate: 5.0)

      visit root_path
      click_link "ログイン"
      fill_in "メールアドレス", with: @user.email
      fill_in "パスワード", with: @user.password
      click_button "ログイン"
    end

    scenario 'Index' do
      visit posts_path
      expect(page).to have_content "おいしいつけ麺"
      expect(page).to have_content "#{@user.name}"
    end

    scenario 'Show' do
      visit post_path(@post.id)
      expect(page).to have_content "おいしいつけ麺"
      expect(page).to have_content "これはテストです。"
      expect(page).to have_content "#{@user.name}"

      expect(page).to have_link "投稿編集"
      expect(page).to have_link "削除"
      expect(page).to have_content "コメント一覧"
    end
  end

  feature 'Check New Post' do
    background do
      @user = FactoryBot.create(:user)

      visit root_path
      click_link "ログイン"
      fill_in "メールアドレス", with: @user.email
      fill_in "パスワード", with: @user.password
      click_button "ログイン"
    end

    scenario 'New' do
      visit root_path
      click_link "投稿"
      fill_in 'タイトル', with: 'おいしいつけ麺'
      fill_in '本文', with: 'これはテストです。'
      expect { click_button '投稿する' }.to change(Post, :count).by(1)
      expect(page).to have_content '投稿しました。'
      expect(page).to have_http_status 200
    end
  end

  feature 'Delete Post' do
    background do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post,
                                user_id: @user.id,
                                title: "おいしいつけ麺",
                                text: "これはテストです。",
                                rate: 5.0)

      visit root_path
      click_link "ログイン"
      fill_in "メールアドレス", with: @user.email
      fill_in "パスワード", with: @user.password
      click_button "ログイン"
    end

    scenario 'Destroy' do
      visit post_path(@post.id)
      expect { click_on '削除' }.to change(Post, :count).by(-1)
      expect(page).to have_content '投稿を削除しました。'
      expect(page).to have_http_status 200
    end
  end
end
