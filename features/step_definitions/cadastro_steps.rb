

Dado('que acesso a página de cadastro') do
    visit "http://rocklov-web:3000/signup"
  end
  
Quando('submeto o meu cadastro completo') do

   MongoDB.new.remove_user("tamara@gmail.com")

    find("#fullName").set "Tamara Sem Sobrenome"
    find("#email").set "tamara@gmail.com"
    find("#password").set "pwd123"

    click_button "Cadastrar"
end
  
Então('sou redirecionado para o Dashboard') do
    expect(page).to have_css ".dashboard"
end
 
#sem nome
Quando('submeto o meu cadastro sem o nome') do
    find("#email").set Faker::Internet.free_email
    find("#password").set "pwd123"

    click_button "Cadastrar"
end
  
  Então('vejo a mensagem de alerta: Oops. Informe seu nome completo!') do
   alert = find(".alert-dark")
   expect(alert.text).to eql "Oops. Informe seu nome completo!"

end

#sem email
Quando('submeto o meu cadastro sem o email') do
    find("#fullName").set "Tamara Sem Sobrenome"
    find("#password").set "pwd123"

    click_button "Cadastrar"
end

#email incorreto
Quando('submeto o meu cadastro com email incorreto') do
    find("#fullName").set "Tamara Sem Sobrenome"
    find("#email").set "email*incorreto"
    find("#password").set "pwd123"

    click_button "Cadastrar"
end
  
  Então('vejo a mensagem de alerta: Oops. Informe um email válido!') do
    alert = find(".alert-dark")
   expect(alert.text).to eql "Oops. Informe um email válido!"
end

#sem senha
Quando('submeto o meu cadastro sem a senha') do
    find("#fullName").set "Tamara Sem Sobrenome"
    find("#email").set Faker::Internet.free_email

    click_button "Cadastrar"
end
  
  Então('vejo a mensagem de alerta: Oops. Informe sua senha secreta!') do
    alert = find(".alert-dark")
   expect(alert.text).to eql "Oops. Informe sua senha secreta!"
end
