            #language: pt

            Funcionalidade: Cadastro de Anúncios
            Sendo usuário cadastrado no Rocklov que possui equipamentos musicais
            Quero cadastras meus equipamentos
            Para que eu possa disponibilizá-los par locação


            Cenário: Novo equipamento

            Dado que estou logado como "betao@yahoo.com" e "pwd123"
            E que acesso o formulario de cadastro de anúncios
            E que eu tenho o seguinte equipamento:
            | thumb     | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
            Quando submeto o cadastro desse item
            Então devo ver esse item no meu Dashboard