require 'rails_helper'

RSpec.feature "Todos pueden ver artículos" do
    scenario "Se listan los artículos" do
        admin = Admin.create(email: "admin@gmail.com", name: "Super Admin", password: "password", password_confirmation: "password")
        visit "/admins/sign_in"
        fill_in "Email", with: "admin@gmail.com"
        fill_in "Password", with: "password"
        click_button "Log in"
        
        article_1 = Article.create(name: "Razones por las cuales aprender Ruby on Rails", content: "Es un gran lenguaje de programación")
        article_2 = Article.create(name: "Como instalar Ruby on Rails", content: "Tutorial de instalación")

        visit "/"

        expect(page).to have_content article_1.name
        expect(page).to have_content article_2.name
    end
end