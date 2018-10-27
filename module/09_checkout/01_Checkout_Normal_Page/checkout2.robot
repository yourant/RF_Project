*** Settings ***
Documentation     Checkout每个用例使用同一个上架商品,不同的物流,COD结账方式
Suite Setup       Checkout Suite Setup
Suite Teardown    Checkout Suite Teardown    # close the browser opened for this test suite
Test Setup        Checkout2 Case Setup
Test Teardown     Teardown Test Case
Force Tags        Checkout

Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
checkout_015
    [Documentation]    验证checkout shipping页面，价格详情中，shipping显示正常 >  shipping显示为：$10
    [Tags]    P0    threshold    smoke
    #添加一个价格10 物流
    kwshipping.add_price_fee_shipping_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
	Add Address Common Step
    Text Of Element Should Be Equal With Wait    ${locatorC_checkout_prices_shippingValue}    + $10.00

checkout_018
    [Documentation]    验证checkout shipping页面，订单详情中tax显示正常 >
    [Tags]    P0    threshold    smoke
    #添加一个物流
    kwshipping.add_price_fee_shipping_py
    kwtax.add_default_tax_price_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_taxPrice}   + $266.40

# 由于未埋点，因此元素不好定位，测试不全面。discount code出现于不出现，导致下标定位失败
checkout_024
    [Documentation]    验证checkout shipping页面，total显示正常 > "1.C端购买商品进入checkout shipping页面,2.信息填写栏选择国家 中国,3.选择物流方案：方案1,4.使用优惠码AAA001,5.此订单价格为：,,subtotal：$50.00,shipping：+ $2.00,discount code：- $10.00,tax: + $25.00,6.查看价格详情total"
    [Tags]    P0    threshold    smoke          #后面再做调整
    #添加一个价格10 物流
    kwshipping.add_price_fee_shipping_py
    #.添加一个物流为中国百分之60的税金
    kwtax.add_default_tax_price_py
    ${code}    Create Specific Coupon Code
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Input Text    ${locatorC_checkoutShipping_input_couponCode}    ${code}
    Wait And Click Element    ${locatorC_checkoutShipping_button_couponApply}
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_subtotalPrice}    $444.00
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_totalPrice}    $710.40

checkout_079
    [Documentation]    验证checkout shipping页面，选择国家后，shipping delivery栏会出现此国家对应的运费方案  >  1.C端购买商品women进入checkout shipping页面  2.选择国家中国  3.查看shipping delivery栏
    [Tags]    P0    threshold
    # 添加默认3个物流信息
    kwshipping.add_shipping_with_conf_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Count Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_items_listShippingAndDelivery}    ${3}

checkout_082
    [Documentation]    验证checkout shipping页面，没有可选择物流方案时，payment method 按钮无法点击 > payment method按钮置灰无法点击
    [Tags]    P0    threshold    smoke
    &{conf}=   Create Dictionary
    ...    shipping_plan=[{"name":"price_fee","shipping_method":"price","range_min":"5000.00","range_max":-1,"rate_amount":"10.00","payment_list":"cod;online;custom;credit_card","desc":"","range_unit":"g"}]
    kwshipping.add_shipping_with_conf_py    ${conf}
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_country}    China
    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_province}    Beijing
    Sleep    2
    Element Attribute Should Contain With Wait     ${locatorC_checkoutShipping_button_paymentMethod}    disabled    ${empty}

checkout_083
    [Documentation]    验证B端运费方案设置价格范围时，C端购买的商品价格满足此价格范围，checkout shipping页面将展示此运费方案 > 运费方案中显示：价格方案1
    [Tags]    P0    threshold    smoke
    &{conf}=   Create Dictionary
    ...    shipping_plan=[{"name":"price_fee","shipping_method":"price","range_min":"50.00","range_max":"5000.00","rate_amount":"10.00","payment_list":"cod;online;custom;credit_card","desc":"","range_unit":"g"}]
    kwshipping.add_shipping_with_conf_py    ${conf}
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    #.选择中国
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_select_country}
    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_country}    China
    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_province}    Beijing
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_listShippingAndDeliveryName}[0]    price_fee

checkout_085
    [Documentation]    验证B端运费方案设置重量范围时，C端购买的商品重量满足此重量范围，checkout shipping页面将展示此运费方案 > 运费方案中显示 重量方案1
    [Tags]    P0    threshold    smoke
    &{conf}=   Create Dictionary
    ...    shipping_plan=[{"name":"weight_fee","shipping_method":"weight","range_min":"50.00","range_max":"70.00","rate_amount":"10.00","payment_list":"cod;online;custom;credit_card","desc":"","range_unit":"kg"}]
    kwshipping.add_shipping_with_conf_py    ${conf}
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    #.选择中国
    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_country}    China
    Wait And Select From List By Label     ${locatorC_checkoutShipping_address_select_province}    Beijing
    Text Of Element Should Be Equal With Wait   ${locatorC_checkoutShipping_text_listShippingAndDeliveryName}[0]    weight_fee

checkout_087
    [Documentation]    验证B端运费方案设置数量范围时，C端购买的商品数量满足此数量范围，checkout shipping页面将展示此运费方案 > "1.C端购买5件商品进入checkout shipping页面,2.选择国家：中国,3.查看shipping delivery栏运费方案" >运费方案中显示 数量方案1
    [Tags]    P0    threshold    smoke
    #.添加一个重量运费的物流
    &{conf}=   Create Dictionary
    ...    shipping_plan=[{"name":"quantity_fee","shipping_method":"quantity","range_min":"5.00","range_max":"7.00","rate_amount":"10.00","payment_list":"cod;online;custom;credit_card","desc":"","range_unit":"g"}]
    kwshipping.add_shipping_with_conf_py    ${conf}
    Reload Page And Start Ajax
    Wait And Input Text  ${locatorC_productDetail_input_qtyNum}     5
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    #.选择中国
    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_country}    China
    Wait And Select From List By Label     ${locatorC_checkoutShipping_address_select_province}    Beijing
    Text Of Element Should Be Equal With Wait   ${locatorC_checkoutShipping_text_listShippingAndDeliveryName}[0]    quantity_fee

checkout_090
    [Documentation]    验证B端运费方案中，勾选免运费时，checkout shipping页面，运费栏显示的运费价格为$0.00 >1.B端物流方案中添加物流物流，国家：中国，运费：运费1 不限价格 免运费2.C端购买任意商品进入checkout shipping页面 3.国家选择中国4.查看shipping delivery栏运费
    [Tags]    P0    threshold    smoke
    #.创建运费方案0  中国方案  运费价格0
    kwshipping.add_shipping_with_conf_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    #.选择中国
    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_country}    China
    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_province}    Beijing
    Text Of Element Should Be Equal With Wait   ${locatorC_checkoutShipping_text_listShippingAndDeliveryFee}[0]    $0.00

checkout_097
    [Documentation]    验证checkout shipping页面，选择没有省份的国家后，点击payment method可以跳转到支付页面 > 1.shipping address中选择国家Bouvet Island  2.其他输入框输入合法内容 3.点击payment method按钮
    [Tags]    P0    threshold    smoke
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"30","zone_ids":"-1"}]
    kwshipping.add_shipping_with_conf_py    ${conf}
    Reload Page And Start Ajax
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    #添加是shipping address
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_firstName}    firstName
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_lastName}    lastName
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_addr}    addr
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_city}    city
    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_country}    Bouvet Island
    Sleep    1
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_postalCode}    123456
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_phone}    18899999999
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_email}    1234567@email.com
    Wait And Input Text    ${locatorC_checkoutShipping_input_contactEmail}    1234567@contactEmail.com
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_company}    company
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_apartment}    apartment
    Sleep    4
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Text   Payment method

checkout_107
    [Documentation]   验证checkout 支付页面，价格详情中，shipping显示正常  > 1.C端购买商品进入checkout shipping页面  2.填写购买人信息，国家选择：中国  3.选择运费：方案0  4.进入支付页面查看价格详情中shippinga
    [Tags]    P0    threshold    smoke
    #.创建运费方案0  中国方案  运费价格10
    kwshipping.add_price_fee_shipping_py
    #添加是shipping address
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutPayment_text_shippingPrice}    + $10.00

checkout_113
    [Documentation]   验证checkout 支付页面，total显示正常
    [Tags]    P0    threshold
    kwshipping.add_price_fee_shipping_py
    ${code}    Create Specific Coupon Code
    kwtax.add_default_tax_price_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Input Text     ${locatorC_checkout_input_discountCode}     ${code}
    Wait And Click Element   ${locatorC_checkout_submit_apply}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Text Of Element Should Be Equal With Wait   ${locatorC_checkoutShipping_text_totalPrice}     $710.40

#设计   是  shipping method 运费方案 1   价格10
checkout_118
    [Documentation]   验证checkout 支付页面，payment栏，shipping method显示正常  >  1.购买商品进入checkout shipping页面  2.选择运费方案：运费1   3.进入支付页面查看payment栏，shipping methoda
    [Tags]    P0    threshold    smoke
    kwshipping.add_price_fee_shipping_py
    Reload Page And Start Ajax
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Text Of Element Should Be Equal With Wait   ${locatorC_checkoutShipping_text_listShippingAndDeliveryFee}     $10.00
    Wait And Click Element      ${locatorC_checkoutShipping_button_paymentMethod}
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutPayment_text_shippingMethod}     price_fee

checkout_120
    [Documentation]         验证checkout支付页面，payment栏，change按钮可返回到shipping页面  >  1.点击payment栏的change按钮
    [Tags]    P0    threshold
    kwshipping.add_price_fee_shipping_py
    Reload Page And Start Ajax
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    #添加是shipping address
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Locator    ${locatorC_checkoutPayment_link_paymentChange}
    Wait And Click Element    ${locatorC_checkoutPayment_link_paymentChange}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_input_firstName}

checkout_163
    [Documentation]   验证checkout页面，stripe支付信息中输入错误的信用卡号时，订单会支付失败  >  1.stripe支付信息中填写信息： 卡号：4111119987834534 有效日期：11/23  安全码：123 邮编：518000 2.点击place order按钮
    [Tags]    P0    threshold    smoke
    kwshipping.add_price_fee_shipping_py
    #.激活stripe 信用卡支付方式
    kwpayment.activate_payment_credit_card_py
    Reload Page And Start Ajax
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait And Click Element    ${locatorC_checkoutPayment_payment_menthodItem}[1]
    #.信用卡信息填写
    Add Credit Card Info
    Wait And Click Element      ${locatorC_checkoutShipping_button_completOrder}
    Wait Until Page Contains Text   Payment failure!
    #关闭credit_card  信用卡支付方式
    kwpayment.inactivate_payment_credit_card_py

checkout_168
    [Documentation]   验证checkout支付页面，billing address栏选择框可点击以及选择项展示  >   1.点击选择框
    [Tags]    P0    threshold    smoke
    kwshipping.add_price_fee_shipping_py
    Reload Page And Start Ajax
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait And Click Element    ${locatorC_checkoutPayment_payment_menthodItem}[0]
    #点击billing address栏选择框
    Wait And Click Element    ${locatorC_checkout_select_billingAddress}
    Wait Until Page Contains Locator     ${locatorC_checkout_select_billingAddress}    1

checkout_169
    [Documentation]  验证checkout支付页面，选择new billing address之后，选择框下方会出现信息填写栏  >  1.点击选择框   2.选择new billing address
    [Tags]    P0    threshold
    kwshipping.add_price_fee_shipping_py
    Reload Page And Start Ajax
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait And Click Element    ${locatorC_checkoutPayment_payment_menthodItem}[0]
    #点击billing address栏选择框
    Wait And Click Element    ${locatorC_checkout_select_billingAddress}
    Wait And Select From List By index     ${locatorC_checkout_select_billingAddress}    1

checkout_194
    [Documentation]   验证payment successful页面，物流方案显示正常  >  1.购买商品进入checkout shipping页面  2.国家选择中国，物流方案选择：方案1 3.完成订单进入payment successful页面  4.查看物流方案
    [Tags]    P0    threshold    smoke
    kwshipping.add_shipping_with_conf_py    ${conf}
    Reload Page And Start Ajax
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait And Click Element    ${locatorC_checkoutPayment_payment_menthodItem}[0]
    Wait And Click Element    ${locatorC_checkoutShipping_button_completOrder}
    Wait Until Page Contains Text    price_fee
