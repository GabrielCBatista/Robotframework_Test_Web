*** Variables ***
${CHECKOUT}             //div[@class='app_logo']
${PEDIDO}               //div[@class='summary_info_label'][contains(.,'Payment Information')]
${SUBTOTAL}             //div[contains(@class,'summary_subtotal_label')]
${IMPOSTO}              //div[contains(@class,'summary_tax_label')]
${TOTAL}                //div[@class='summary_info_label summary_total_label']
${FINISH}               finish
${FIM DO PEDIDO}        //h2[contains(.,'Thank you for your order!')]