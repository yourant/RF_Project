*** Settings ***
Documentation     结账页设置功能测试
Suite Setup       Checkout Page Suite Setup
Suite Teardown    Checkout Page Suite Teardown
Test Setup        Checkout Page Test Setup
Test Teardown     Teardown Test Case
Force Tags        checkoutPageSetings

Resource        ../../../resources/keywords/kw_common.robot


*** Test cases ***
checkoutPageSetings021
    [Documentation]    测试顾客信息设置-点击姓和名分开.1.姓名格式勾选姓名时 点击 姓、名分开填写  2.点击保存
    [Tags]    P0    threshold   smoke
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_surnameAndName}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_surnameAndName}    class    ant-radio-wrapper ant-radio-wrapper-checked
    #.进入C端checkout shipping界面验证
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_input_firstName}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_input_lastName}

checkoutPageSetings022
    [Documentation]    测试顾客信息设置-点击姓和名分开.1.姓名格式勾选姓、名分开填写时 点击 姓名  2.点击保存
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_name}
    Sleep And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_name}    class    ant-radio-wrapper ant-radio-wrapper-checked
    #.进入C端checkout shipping界面验证
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_input_onlyName}

checkoutPageSetings023
    [Documentation]    测试顾客信息设置-.1.公司名点击 必填 2.点击保存
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_companyNameMandatory}
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_companyNameMandatory}    class    ant-radio-wrapper ant-radio-wrapper-checked
    #.进入C端checkout shipping界面验证
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_company}     ${empty}
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Text    Please enter your company

checkoutPageSetings024
    [Documentation]    测试顾客信息设置-.1.公司名点击 选填 2.点击保存
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_companyNameOptional}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_companyNameOptional}    class    ant-radio-wrapper ant-radio-wrapper-checked
    #.进入C端checkout shipping界面验证
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_company}     ${empty}
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Locator    ${locatorC_checkout_button_completeOrder}

checkoutPageSetings025
    [Documentation]    测试顾客信息设置-点击姓和名分开.1.公司名点击 隐藏 2.点击保存
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_companyNameHidden}
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_companyNameHidden}    class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Not Contains Locator    ${locatorC_checkoutShipping_address_input_company}

#checkoutPageSetings026.1
#    [Documentation]    测试顾客信息设置-点击姓和名分开.1.邮箱必填 2.点击保存
#    [Tags]    P0    threshold
#    Wait And Click Element    ${locatorB_checkout_button_nav_information}
#    Wait And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
#    Sleep And Click Element    ${locatorB_checkout_button_save}
#    Wait Until Page Contains Text   设置成功
#    Reload Page And Start Ajax
#    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeMandatory}   class    ant-radio-wrapper ant-radio-wrapper-checked
#    Go To First Product C Interface
#    sleep    10
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#    Wait And Input Text    ${locatorC_checkoutShipping_address_input_email}    ${Empty}
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait Until Page Contains Text    Please enter your email

checkoutPageSetings027.1
    [Documentation]    测试顾客信息设置-点击姓和名分开.1.y邮箱选填  2.点击保存
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_emailCodeOptional}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeOptional}   class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_email}    ${Empty}
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Locator    ${locatorC_checkout_button_completeOrder}

checkoutPageSetings028.1
    [Documentation]    测试顾客信息设置-点击姓和名分开.1.邮箱隐藏 2.点击保存
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_emailCodeHidden}
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeHidden}   class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Not Contains Locator    ${locatorC_checkoutShipping_address_input_email}

checkoutPageSetings029
    [Documentation]    测试顾客信息设置-输入退款条约
    [Tags]    P0    threshold   smoke
    Wait And Click Element    ${locatorB_checkout_button_nav_serviceTerms}
    Wait And Input Text     ${locatorB_checkout_textarea_refundTreatyInputBox}     退款条约内容
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Reload Page And Start Ajax
    Wait Until Page Contains Text    退款条约内容
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Click Element    ${locatorC_checkoutShipping_li_TextPolicy}
    Wait Until Page Contains Text    退款条约内容


checkoutPageSetings030
    [Documentation]    测试顾客信息设置-输入隐私政策
    [Tags]    P0    threshold
    Wait And Click Element      ${locatorB_checkout_button_nav_serviceTerms}
    Wait And Input Text     ${locatorB_checkout_textarea_policyInputBox}     隐私政策内容
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Reload Page And Start Ajax
    Wait Until Page Contains Text    隐私政策内容
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Click Element    ${locatorC_checkoutShipping_li_TextPolicy}
    Wait Until Page Contains Text    隐私政策内容

checkoutPageSetings031
    [Documentation]    测试顾客信息设置-输入服务条约
    [Tags]    P0    threshold
    Wait And Click Element      ${locatorB_checkout_button_nav_serviceTerms}
    Wait And Input Text     ${locatorB_checkout_textarea_refundServiceInputBox}     服务条约内容
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Reload Page And Start Ajax
    Wait Until Page Contains Text    服务条约内容
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Click Element    ${locatorC_checkoutShipping_li_TextPolicy}
    Wait Until Page Contains Text    服务条约内容