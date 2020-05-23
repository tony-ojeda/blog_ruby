require 'rails_helper'

RSpec.feature "Admins pueden crear articulos" do
    
    before do
        visit "/"
        click_link "Nuevo Artículo"
    end

    scenario "con atributos válidos" do
        fill_in "Name", with: "Razones por las cuales aprender Ruby on Rails"
        fill_in "Content", with: "Es un gran lenguaje de programación"
        attach_file "Main image", "/home/tony-ojeda/Documents/blog/spec/images/2.jpg"
        click_button "Guardar"

        expect(page).to have_content "Razones por las cuales aprender Ruby on Rails"
        expect(page).to have_content "Es un gran lenguaje de programación"
    end
    
    scenario "con atributos inválidos" do
        click_button "Guardar"

        expect(page).to have_content "No se pudo guardar. Los campos de nombre y contenido deben de estar llenos."
    end
end