require 'rails_helper'

RSpec.feature "Homes", type: :feature do
  feature 'Check Templates' do
    scenario 'Home' do
      visit root_path
      expect(page).to have_http_status "200"
      expect(page).to have_title "つけログ"
      expect(page).to have_content "おいしいつけ麺をつけログで共有しよう!"
      expect(page).to have_content "すべての投稿"
      expect(page).to have_content "新着"
      expect(page).to have_content "人気"
    end
  end

  feature 'Check Links' do
    background do
      visit root_path
    end

    scenario 'Check Header(bofore login)' do
      expect(page).to have_content "つけログ"
      expect(find(".search")[:href]).to eq search_posts_path
      expect(find(".users")[:href]).to eq users_path
      expect(page).to have_content "about"
      expect(page).to have_link "ログイン"
      expect(page).to have_link "新規登録"
    end

    scenario 'Check Header(after login)' do
      user = FactoryBot.create(:user)

      click_link "ログイン"
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      click_button "ログイン"

      expect(page).to have_content "つけログ"
      expect(find(".search")[:href]).to eq search_posts_path
      expect(find(".users")[:href]).to eq users_path
      expect(find(".user-image")[:href]).to eq user_path(user.id)
      expect(page).to have_link "#{user.name}"
      expect(page).to have_link "投稿"
    end
  end
end
