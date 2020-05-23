require 'rails_helper'
require 'base64'

RSpec.feature "Admins pueden eliminar imágenes" do
    scenario "se eliminan correctamente" do
        admin = Admin.create(email: "admin@gmail.com", name: "Super Admin", password: "password", password_confirmation: "password")
        visit "/admins/sign_in"
        fill_in "Email", with: "admin@gmail.com"
        fill_in "Password", with: "password"
        click_button "Log in"
        
        article_1 = Article.create(name: "Razones porlas cuales aprender Ruby on Rails",
        content: "Es un gran lenguaje de programación")
        image = File.new("spec/images/2.jpg")
        image_base_64 = "data:image/jpeg;base64," + Base64.encode64(image.read)
        image_1 = Image.create(image: image_base_64, article_id: article_1.id )

        edited_image = File.new('spec/images/3.jpg')
        edited_image_base_64 = "data:image/jpeg;base64," + Base64.encode64(edited_image.read)

        visit "/"
        click_link article_1.name
        click_link "Eliminar Imagen"

        expect(page).to have_no_xpath("//img[@src='"+image_base_64+"']")
    end
end