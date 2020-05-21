require 'rails_helper'

RSpec.feature "Admins pueden editar articulos" do
    scenario "con atributos válidos artículos" do
        article_1 = Article.create(name: "Razones por las cuales aprender Ruby on Rails",
        content: "Es un gran lenguaje de programación")
        
        visit "/"
        click_link article_1.name
        click_link "Editar"

        fill_in "Name", with: "Por esto deberías aprender Ruby on Rails"
        fill_in "Content", with: "Es el mejor lenguaje de progración"
        click_button "Guardar"

        expect(page).to have_content "Por esto deberías aprender Ruby on Rails"
        expect(page).to have_content "Es el mejor lenguaje de progración"
    end
end