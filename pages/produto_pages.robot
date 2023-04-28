*** Settings ***
Resource               ../fixtures/test_data.robot
Resource               ../resources/produto_resource.robot
*** Variables ***
@{PRODUTO_IDS}    Create List    
...    add-to-cart-sauce-labs-backpack    
...    add-to-cart-sauce-labs-bike-light    
...    add-to-cart-sauce-labs-bolt-t-shirt
...    add-to-cart-sauce-labs-fleece-jacket
...    add-to-cart-sauce-labs-onesie
...    add-to-cart-test.allthethings()-t-shirt-(red)

@{LIST_ORDEN}        Create List    az    za    lohi    hilo
${CONTAINER}         //select[@class='product_sort_container']
${BOTAO_REMOVER}     //button[contains(.,'Remove')]
${CARRINHO_0}        //a[contains(@class,'link')]