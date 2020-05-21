require 'rails_helper'

RSpec.feature "Admins pueden eliminar artículos" do
    scenario "Se elimina" do
        article_1 = Article.create(name: "Razones por las cuales aprender Ruby on Rails", content: "Es un gran lenguaje de programación")

        visit "/"
        click_link article_1.name
        click_link "Eliminar"

        expect(page).to have_no_content "Razones por las cuales aprender Ruby on Rails"
    end
end