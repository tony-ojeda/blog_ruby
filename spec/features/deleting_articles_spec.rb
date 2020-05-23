require 'rails_helper'

RSpec.feature "Admins pueden eliminar artículos" do
    scenario "Se elimina" do
        admin = Admin.create(email: "admin@gmail.com", name: "Super Admin", password: "password", password_confirmation: "password")
        visit "/admins/sign_in"
        fill_in "Email", with: "admin@gmail.com"
        fill_in "Password", with: "password"
        click_button "Log in"
        
        article_1 = Article.create(name: "Razones por las cuales aprender Ruby on Rails", content: "Es un gran lenguaje de programación")

        visit "/"
        click_link article_1.name
        click_link "Eliminar"

        expect(page).to have_no_content "Razones por las cuales aprender Ruby on Rails"
    end
end