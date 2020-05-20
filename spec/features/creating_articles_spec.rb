require 'rails_helper'

RSpec.feature "Admins pueden crear articulos" do
    scenario "con atributos válidos" do
        visit "/"
        click_link "Nuevo Artículo"
        fill_in "Name", with: "Razones por las cuales aprender Ruby on Rails"
        fill_in "Content", with: "Es un gran lenguaje de programación"
        attach_file "Main image", "/home/tony-ojeda/Documents/blog/spec/images/2.jpg"
        click_button "Guardar"

        expect(page).to have_content "Razones por las cuales aprender Ruby on Rails"
        expect(page).to have_content "Es un gran lenguaje de programación"
    end
end