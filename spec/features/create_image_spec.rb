require 'rails_helper'
require 'base64'

RSpec.feature "Admins pueden añadir imágenes a articulos" do
    scenario "con atributos validos" do
        article_1 = Article.create(name: "Razones porlas cuales aprender Ruby on Rails",
        content: "Es un gran lenguaje de programación")
        image = File.new("/home/tony-ojeda/Documents/blog/spec/images/2.jpg")
        image_base_64 = "data:image/jpeg;base64," + Base64.encode64(image.read)

        visit "/"
        click_link article_1.name
        click_link "Añadir imagen"
        attach_file "Image","/home/tony-ojeda/Documents/blog/spec/images/2.jpg"
        click_button "Guardar"

        expect(page).to have_xpath("//img[@src='"+image_base_64+"']")
    end
end