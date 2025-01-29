*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}                    https://www.amazon.com.br   # Criando  variavel da url
${MENU_TODOS}             //a[contains(@aria-label,'Abrir o menu Todas as categorias')]
${MENU_MAIS_VENDIDOS}     //div[@id="hmenu-content"]/ul[1]/li[2]/a   
${MENU_ELETRONICOS}       xpath=(//a[text()='Eletrônicos'])[2]
${MENU_COMPUTADORES}      xpath=(//a[text()='Computadores e Informática'])
${TITLE}                  xpath=//h1[@class='a-size-large a-spacing-medium a-text-bold'][contains(.,'Mais Vendidos em Computadores, Componentes e Acessórios')]

*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
Fechar navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    ${URL}    # pegar a variavel da url Go To é ir na página
    Wait Until Element Is Visible    ${MENU_TODOS}   timeout=10s 

Entrar no menu "Todos"
    Click Element    ${MENU_TODOS}
    Wait Until Element Is Visible    ${MENU_MAIS_VENDIDOS}    timeout=10s

Entrar no menu "Mais Vendidos"
    Click Element    ${MENU_MAIS_VENDIDOS}
    Wait Until Element Is Visible    ${MENU_ELETRONICOS}    timeout=10s

Entrar no menu "Eletrônicos"
    Scroll Element Into View   ${MENU_ELETRONICOS}
    Sleep    5s
    Click Element              ${MENU_ELETRONICOS}
    Wait Until Page Contains    Eletrônicos    timeout=40s
    Wait Until Element Is Visible    ${MENU_COMPUTADORES}   timeout=10s

Entrar no menu "Computadores e Informática"
    Click Element    ${MENU_COMPUTADORES}
    Wait Until Element Is Visible    ${TITLE}    timeout=10s

Verificar se o título da página está correto "Mais Vendidos em Computadores, Componentes e Acessórios"
    ${text}=                   Get Text    ${TITLE}
    Log                        Texto encontrado: '${text}'
    Should Contain             ${text}    Mais Vendidos em Computadores, Componentes e Acessórios



