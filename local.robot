*** Settings ***
Documentation     Essa suite testa o site da Amazon.com.br
Resource          compartilha_resources.robot
Test Setup        Abrir o navegador  
Test Teardown     Fechar navegador 



*** Test Cases ***
Case Test 01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu Mais Vendido do site da Amazon
    ...              e valida a categoria Eletrônicos
    [Tags]           Menus categorias 
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Todos"  
    Entrar no menu "Mais Vendidos"   
    Entrar no menu "Eletrônicos"
    Entrar no menu "Computadores e Informática"                          
    Verificar se o título da página está correto "Mais Vendidos em Computadores, Componentes e Acessórios"

Case Test 02 - Pesquisar um Produto

    [Documentation]  #Esse teste verifica a busca de um produto navegador site da Amazon
    ...              
    [Tags]           busca_produto   lista_busca 

    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultao da pesquisa se está listando o produto "Console Xbox Series S"

