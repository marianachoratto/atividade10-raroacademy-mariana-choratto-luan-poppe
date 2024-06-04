*** Settings ***
Resource    ../../base.robot

Test Setup        Abrir App
Test Teardown     Teardown    


*** Test Cases ***
Usuário deve poder acessar a seção de importar dados
    Dado que acessei o aplicativo
    Quando usuário acessar a seção de importar dados
    Então deve ser possível ver as informações e instruções sobre importação de dados

# Teste dando erro
Usuário deve poder importar dados de produtos
    Dado que realizei a exportação de produtos
    E acessei a seção de importar dados
    Quando executo a funcionalidade de restaurar produtos
    Então deve ser possível restaurar dados de produtos a partir de exportações realizadas previamente
    E o produto restaurado deve se encontrar na página de produtos

Usuário deve poder importar dados de entradas
    Dado que realizei uma entrada de algum produto
    E acessei a seção de importação
    Quando executo a funcionalidade de restaurar entradas
    Então deve ser possível restaurar dados de entradas a partir de exportações realizadas previamente
    # E o produto restaurado deve se encontrar na página de produtos

# Usuário deve poder importar dados de saídas
#     Dado que realizei a exportação de produtos
#     E acessei a seção de importar dados
#     Quando executo a funcionalidade de restaurar produtos
#     Então deve ser possível restaurar dados de produtos a partir de exportações realizadas previamente
#     E o produto restaurado deve se encontrar na página de produtos
# Usuário deve poder importar dados de grupos
#     Dado que realizei a exportação de produtos
#     E acessei a seção de importar dados
#     Quando executo a funcionalidade de restaurar produtos
#     Então deve ser possível restaurar dados de produtos a partir de exportações realizadas previamente
#     E o produto restaurado deve se encontrar na página de produtos