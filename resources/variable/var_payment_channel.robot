*** Variables ***
#.locatorB  收款渠道

#. icon
${locatorB_pay_icon_paypalPrompt}    dom:document.querySelectorAll('[class*="icon_more"]')[0]     #. icon paypal收款提示信息


#. button
${locatorB_pay_button_paypalActivation}    dom:document.querySelectorAll('[class*="ant-btn"]')[0]    #. paypal 收款激活/编辑按钮
${locatorB_pay_button_creditCardActivation}    dom:document.querySelectorAll('[class*="ant-btn"]')[1]    #. 信用卡 收款激活/编辑按钮
${locatorB_pay_button_deliveryActivation}    dom:document.querySelectorAll('[class*="ant-btn"]')[2]    #. 货到付款激活/编辑按钮

${locatorB_pay_button_replaceUserCard}    dom:document.querySelectorAll('[class*="form_content"] button[class*="ant-btn"]')[0]   #.更换会员卡
#. button switch
${locatorB_pay_switch_creditCardSwitch}    dom:document.querySelectorAll('div[class*="payment_wrap"]:nth-child(2) [data-robot="pay_on_off"]')[0]    #.信用卡收款 开关按钮
${locatorB_pay_switch_codSwitch}    dom:document.querySelectorAll('[id="cod"] button[data-robot="pay_on_off"]')[0]    #.货到付款  开关按钮
#. 绑定按钮

${locatorB_pay_button_bindingMembers}    dom:document.querySelectorAll('[data-robot="pay_binding"]')[0]    #. 绑定按钮
#. link
${locatorB_pay_link_replacePay}    dom:document.querySelectorAll('[class*="change_payment"]')[0]    #. 信用卡收款 更换收款方式
${locatorB_pay_link_replacePay_popUp}    dom:document.querySelectorAll('[class="ant-modal-content"]')    #. 信用卡收款 更换收款方式 弹窗

#. input
${locatorB_pay_input_deliveryPayName}    dom:document.querySelectorAll('input[class="ant-input"]')[0]     #.货到付款文本框输入-支付名称
${locatorB_pay_textarea_deliveryPayInstructions}    dom:document.querySelectorAll('[class*="text_area"]')[0]     #.货到付款文本框输入-支付说明
${locatorB_pay_input_deliveryPayWay}    dom:document.querySelectorAll('[class*="text_area"]')[1]      #.货到付款文本框输入-支付指示
${locatorB_pay_button_save}    dom:document.querySelectorAll('[class*="form_container"] [class*="middle_btn"]')[0]     #.货到付款  保存按钮
${locatorB_pay_button_canecl}    dom:document.querySelectorAll('[class*="form_container"] [class*="default_btn"]')[0]     #.货到付款  取消按钮

${locatorB_pay_button_changeNum}    dom:document.querySelectorAll('[class*="ant-btn default_btn"]')[1]    #信用卡收款-编辑-更换会员号按钮

#.绑定ipaylinks会员号
${locatorB_pay_input_userCard}    dom:document.querySelectorAll('input[id="client_id"]')[0]     #.会员号
${locatorB_pay_input_pwsKey}    dom:document.querySelectorAll('input[id="secret_key"]')[0]    #.秘钥
#.秘钥内容
${locatorB_pay_input_pwsKeyText}    30820122300d06092a864886f70d01010105000382010f003082010a028201010098da23b3f3e679efb33e8171191e165ca1a757e53e74393cd23a0bf9adbbaecdd8224c4666ed421ce6b099e66807e85e4247c07261792a66ccbd71cc8fb7e87c34e2bcf2ffb5df9004488ec3a32353e91cadc56cf980eda1784186c1c270587907e2db749fd904dc39b28670699dd654a6001e0289e2988648ae3fca5e45ed356d1a81a84029357eb017f925c8dc174ce82ac12b8681282abb5e83aef1fa6416f3fba32cb45432f51a700f995ccee4d8a9dea66d31607f14a546011ec44807056f54330389e78b12d355527ab62e904f8918c8f417e0afaf154b772fc5dce7aac4a71426f9a623155484d8c7f73e2511f1866661b3a8083ea087f3162cf3aa090203010001
#. 绑定钱海账号
${locatorB_pay_input_account}    dom:document.querySelectorAll('input[id="account"]')[0]     #.账号
${locatorB_pay_input_terminal}    dom:document.querySelectorAll('input[id="client_id"]')[0]    #.客户端ID
${locatorB_pay_input_secureCode}    dom:document.querySelectorAll('input[id="secret_key"]')[0]      #.秘钥

${locatorB_pay_creditCard_button_ipaylinks}    dom:document.querySelectorAll('[class*="ant-btn middle_btn"]')[0]    #信用卡选择-ipaylinks收款
${locatorB_pay_creditCard_button_oceanpayment}    dom:document.querySelectorAll('[class*="ant-btn middle_btn"]')[1]    #信用卡选择-钱海收款
${locatorB_pay_creditCard_button_stripe}    dom:document.querySelectorAll('[class*="ant-btn middle_btn"]')[2]    #信用卡选择-stripe收款





