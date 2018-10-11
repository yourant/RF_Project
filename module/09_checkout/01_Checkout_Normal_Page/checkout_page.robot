*** Settings ***
Documentation     Ckeckout Page Check
Suite Setup       Checkout Common Step
Suite Teardown    Common Teardown    # close the browser opened for this test suite
Test Teardown     Teardown Test Case
Force Tags        Checkout

Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_checkout.robot
Resource          ../../../resources/variable/var_checkout.robot
Resource          ../../../resources/variable/var_checkout.robot
Resource          ../../../resources/variable/var_product_management.robot
Library           ${CURDIR}/../../../lib/customlib/kwproduct.py
Library           ${CURDIR}/../../../lib/customlib/kwshipping.py
Library           ${CURDIR}/../../../lib/customlib/kwtax.py
Library           ${CURDIR}/../../../lib/customlib/kwmarketing.py
Library           ${CURDIR}/../../../lib/customlib/lib_utils.py

*** Test Cases ***
checkout001
    [Documentation]    C端将商品加入购入车再点击checkout 显示购买的商品，地址，买家留言，商品总价及提交按钮
    [Tags]    P0    threshold    smoke
    #.click products btn
    Click Preview Step
    Wait Until Element Is Visible    ${locatorB_checkout_add_card_btn}
    Page Should Contain Image    dom:document.querySelectorAll("img")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".sales_price")[0]

checkout002
    [Documentation]    进入checkout界面 显示购买的商品，地址，
    [Tags]    P0    threshold    smoke
    #点击商品预览
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Sleep    2
    Wait Until Page Contains Locator    dom:document.querySelectorAll(".addressForm")[0]

checkout006
    [Documentation]    验证checkout shipping页面，订单汇总，商品栏，商品标题显示正常
    [Tags]    P0    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Sleep    2
    Wait Until Page Contains Locator    ${locatorB_checkout_address_showProduct_eml}

checkout_007
    [Documentation]    验证checkout shipping页面，订单汇总，商品栏，商品子产品显示正常 > "1.C端购买商品women的子款式：blue XXL,2.进入checkout shipping页面,3.查看订单汇总商品栏子产品" > "子产品显示为：,color：blue,size：XXL"
    [Tags]    P0    threshold    smoke
    # 添加一个待自产品的商品
    kwproduct.add_one_product_with_sub_py
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    #Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    Wait Until Page Contains    Color:red
    Wait Until Page Contains    Size:min
    
checkout_008
    [Documentation]    验证checkout shipping页面，订单汇总商品栏，商品数量显示正常 > "1.C端够买商品women5件进入checkout shipping页面,2.查看订单汇总商品栏，商品数量显示" > 商品数量显示为：X5
    [Tags]    P0    threshold    smoke
    Click Preview Step
    #.先点击选中颜色，尺寸
    Wait And Click Element    ${locatorB_checkout_selectColor_elm}
    #.输入数量
    Wait And Input Text    dom:document.querySelectorAll(".qty-num")[0]    5
    #,点击立即购买
    Wait And Click Element    dom:document.querySelectorAll(".second_btn")[0]
    Sleep    2
    Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    #.获取数量
    Wait Until Element Is Visible    dom:document.querySelectorAll("tbody tr td")[2]
    ${res}    Execute JavaScript    return document.querySelectorAll("tbody tr td")[2].innerText
    Should Be True    '${res}'=='X5'

checkout_009
    [Documentation]    验证checkout shipping页面，订单汇总商品栏，商品价格显示正常 >"1.C端购买商品women进入checkout shipping页面,2.查看订单汇总商品栏，商品价格显示" > 商品价格显示为：444USD
    [Tags]    P0    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Sleep    2
    Wait Until Page Contains Locator        dom:document.querySelectorAll(".order_price")[0]
    ${res}    Execute JavaScript    return document.querySelectorAll(".order_price")[0].innerText
    Should Be True    '${res}'=='$99.00'

checkout_014
    [Documentation]    验证checkout shipping页面，subtotal显示正常 > "1.C端购买商品women两件进入checkout shipping页面,2.查看价格详情中subtotal" > subtotal为：$444.00
    [Tags]    P0    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Sleep    2
    Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    Wait Until Page Contains Locator    dom:document.querySelectorAll("tfoot tr td")[1]
    ${res}    Execute JavaScript    return document.querySelectorAll("tfoot tr td")[1].innerText
    Should Be True    '${res}'=='$99.00'

checkout_015
    [Documentation]    验证checkout shipping页面，价格详情中，shipping显示正常 >  shipping显示为：$10
    [Tags]    P0    threshold    smoke
    kwshipping.del_all_shipping_py
    #.添加中国物流
    kwshipping.add_shipping_py
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    Sleep    2
    Wait And Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Sleep    5
    Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    ${res}    Execute JavaScript    return document.querySelectorAll("tbody tr td")[7].innerText
    Should Be True    '${res}'=='+ $10.00'

checkout_018
    [Documentation]    验证checkout shipping页面，订单详情中tax显示正常 > 
    [Tags]    P0    threshold    smoke
    #.添加一个物流为中国百分之60的税金
    add_other_tax_price_py    60
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    Sleep    2
    Wait And Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Sleep    5
    Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    Wait Until Page Contains Locator    dom:document.querySelectorAll("tbody tr td")[9]

checkout_021
    [Documentation]    验证checkout shipping页面，使用优惠码后，价格详情中会出现discount code并显示优惠价格 > "1.C端购买商品women进入checkout shipping页面，2.使用优惠码AAA001，3.查看价格详情" > 价格详情显示优惠金额
    [Tags]    P0    threshold    smoke
    #.添加一个满50减10的全场优惠券
    kwmarketing.add_coupon_py    1
    #. 先获得优惠码
    Go To Coupon Page
    Sleep    2
    Wait Until Page Contains    优惠码
    ${copun}    Execute JavaScript    return document.querySelectorAll("tbody tr:nth-child(1) td")[2].innerText
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Sleep    3
    Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    #.输入优惠码
    Wait And Input Text    ${locatorB_checkout_addressCoupon_ipt}    ${copun}
    #.点击应用
    Wait And Click Element    ${locatorB_checkout_addressClickCoupon_btn}
    Wait Until Page Contains    Discount code

checkout_024
    [Documentation]    验证checkout shipping页面，total显示正常 > "1.C端购买商品进入checkout shipping页面,2.信息填写栏选择国家 中国,3.选择物流方案：方案1,4.使用优惠码AAA001,5.此订单价格为：,,subtotal：$50.00,shipping：+ $2.00,discount code：- $10.00,tax: + $25.00,6.查看价格详情total"
    [Tags]    P0    threshold    smoke
    #.添加一个满50减10的全场优惠券
    kwmarketing.add_coupon_py    1
    #.先删除所有物流
    kwshipping.del_all_shipping_py
    #.添加一个物流为中国百分之60的税金
    add_other_tax_price_py    60
    #. 先获得优惠码
    Go To Coupon Page
    Sleep    2
    Wait Until Page Contains    优惠码
    ${copun}    Execute JavaScript    return document.querySelectorAll("tbody tr:nth-child(1) td")[2].innerText
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    Sleep    2
    Wait And Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Sleep    4
    #，点击查看详情的下拉剪头
    Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    #.输入优惠码
    Wait And Input Text    ${locatorB_checkout_addressCoupon_ipt}    ${copun}
    #.点击应用
    Wait And Click Element    ${locatorB_checkout_addressClickCoupon_btn}
    #.获取优惠券价格,物流价格
    Wait Until Page Contains Locator    dom:document.querySelectorAll(".checkout-prices-value")[0]
    ${total}    Get Text    dom:document.querySelectorAll(".checkout-prices-value")[0]
    Sleep Time
    Wait Until Page Contains Locator    dom:document.querySelectorAll(".checkout-prices-value")[1]
    ${nums}    Get Text    dom:document.querySelectorAll(".checkout-prices-value")[1]
    Sleep Time
    Wait Until Page Contains Locator    dom:document.querySelectorAll(".checkout-prices-value")[2]
    ${shipping}    Get Text    dom:document.querySelectorAll(".checkout-prices-value")[2]
    Sleep Time
    Wait Until Page Contains Locator    dom:document.querySelectorAll(".checkout-prices-value")[3]
    ${code}    Get Text    dom:document.querySelectorAll(".checkout-prices-value")[3]
    Sleep Time
    #.获取total
    Wait Until Page Contains Locator    dom:document.querySelectorAll("tfoot tr td")[1]
    ${exs}    Get Text    dom:document.querySelectorAll("tfoot tr td")[1]
    #.去掉多余字符后运算
    ${exsx}    lib_utils.searchStrs_py    ${exs}
    ${totals}    lib_utils.searchStrs_py    ${total}
    ${numsx}    lib_utils.searchStrs_py    ${nums}
    ${shippings}    lib_utils.searchStrs_py    ${shipping}
    ${codes}    lib_utils.searchStrs_py    ${code}
    #.获取优惠券信息
    ${res}    Evaluate    ${totals}+${shippings}+${codes}-int(${numsx})
    ${rex}    Evaluate    ${res}-1
    Should Be True    ${rex}==${exsx}
    
checkout_025
    [Documentation]    验证checkout shipping页面，优惠码输入框中可输入内容 > "1.点击优惠码输入框,2.输入内容：AAA003" > 优惠码输入框中显示输入的内容：AAA003
    [Tags]    P1    threshold    smoke
    ${num}    Set Variable    AAA003
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    #，点击查看详情的下拉剪头
    Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    #.在优惠码输入框中输入AAA003
    Wait And Input Text    ${locatorB_checkout_addressCoupon_ipt}    ${num}
    ${res}    Get Value    ${locatorB_checkout_addressCoupon_ipt}
    Should Be True    '${res}'=='${num}'

checkout_026
    [Documentation]    验证checkout shipping页面，优惠码输入框后apply按钮可点击>"1.C端购买任意商品进入checkout shipping页面,2.优惠码输入框中输入优惠码AAA006,3.点击apply按钮" > 点击后优惠码使用成功，价格详情中显示discount code： - $10.00
    [Tags]    P0    threshold    smoke
    #.添加一个满50减10的全场优惠券
    kwmarketing.add_coupon_py    1
    #. 先获得优惠码
    Go To Coupon Page
    Sleep    2
    Wait Until Page Contains    优惠码
    ${copun}    Execute JavaScript    return document.querySelectorAll("tbody tr:nth-child(1) td")[2].innerText
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    #，点击查看详情的下拉剪头
    Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    Wait And Input Text    ${locatorB_checkout_addressCoupon_ipt}    ${copun}
    #.点击应用
    Wait And Click Element    ${locatorB_checkout_addressClickCoupon_btn}
    #.获取优惠那一栏的值
    Sleep Time
    Wait Until Page Contains Locator    dom:document.querySelectorAll(".checkout-prices-value")[1]
    ${nums}    Get Text    dom:document.querySelectorAll(".checkout-prices-value")[1]
    Should Be True    '${nums}'=='- $4.95'

checkout_027
    [Documentation]    验证checkout shipping页面输入错误的优惠码时，点击apply，会给出对应提示 > 2.优惠码输入框中输入任意内容：..0001,3.点击apply > 优惠码输入框下方出现错误提示
    [Tags]    P1    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    #，点击查看详情的下拉剪头
    Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    Wait And Input Text    ${locatorB_checkout_addressCoupon_ipt}    ..0001
    #.点击应用
    Wait And Click Element    ${locatorB_checkout_addressClickCoupon_btn}
    Wait Until Page Contains    This discount does not exist.

checkout_034
    [Documentation]    验证checkout shipping页面，shipping address栏，国家选择框可点击以及国家选择展示 > 1.点击shipping address栏国家选择框 >点击后国家选择框下拉展开，显示所有可选择的国家
    [Tags]    P0    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_address_select_country}

checkout_035
    [Documentation]    验证checkout shipping页面，shipping address栏，省份选择框可点击以及省份选择展示  > "1.点击国家选择框选择中国,2.点击省份选择框" > 点击后城市选择框下拉展开，显示中国的所有省份
    [Tags]    P0    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    Sleep    2
    Select From List    ${locatorB_checkout_address_select_country}    China
    Wait And Click Element    ${locatorB_checkout_address_select_province}

checkout_037
    [Documentation]    验证checkout shipping页面，shipping address栏输入正确的信息，可以提交成功 > 输入地址 > 提交成功，页面跳转到支付页面
    [Tags]    P0    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Sleep    2
    Add Address Common Step
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait Until Page Contains    PAYMENT

checkout_073
    [Documentation]    验证checkout shipping页面，点击买家留言栏，可展开买家留言输入框 > 1.点击special instruction栏 > 点击后展开买家留言输入框
    [Tags]    P0    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains    Shipping & Delivery

checkout_077
    [Documentation]    验证checkout shipping页面，买家留言输入框输入的内容，会同步到B端订单详情 > "1.C端发起新订单AAA00111进入checkout shipping页面,2.买家留言输入框中输入内容：请尽快发货,3.完成订单进入B端订单AAA00111详情,4.查看订单详情页面买家留言" > 买家留言内容显示为：请尽快发货
    [Tags]    P0    threshold    smoke
    #.开启pc优化
    kwcheckout.start_pc_show_py    1
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    #.点击展开留言框
    Wait And Click Element    dom:document.querySelectorAll('#instructionToggle')[0]
    #.输入留言
    Wait And Input Text    dom:document.querySelectorAll('textarea[name="customer_note"]')[0]    自动化测试
    #.点击提交
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait Until Page Contains    PAYMENT
    #.关闭PC优化
    kwcheckout.start_pc_show_py


checkout_082
    [Documentation]    验证checkout shipping页面，没有可选择物流方案时，payment method 按钮无法点击 > payment method按钮置灰无法点击
    [Tags]    P0    threshold    smoke
    kwcheckout.start_pc_show_py    1
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait Until Page Does Not Contain    SHIPPING
    
checkout_083
    [Documentation]    验证B端运费方案设置价格范围时，C端购买的商品价格满足此价格范围，checkout shipping页面将展示此运费方案 > 运费方案中显示：价格方案1
    [Tags]    P0    threshold    smoke
    #.开启pc优化
    kwcheckout.start_pc_show_py    1
    #.先删除物流
    kwshipping.del_all_shipping_py
    #.添加一个价格运费物流
    kwshipping.add_shipping_py
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    #.选择中国
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    Sleep    2
    Select From List    ${locatorB_checkout_address_select_country}    China
    Sleep    3
    ${res}    Get Text    dom:document.querySelectorAll(".fl")[4]
    Should Be True    '${res}'=='Standard shipping'
    #.关闭PC优化
    kwcheckout.start_pc_show_py


checkout_085
    [Documentation]    验证B端运费方案设置重量范围时，C端购买的商品重量满足此重量范围，checkout shipping页面将展示此运费方案 > 运费方案中显示 重量方案1
    [Tags]    P0    threshold    smoke
    #.开启pc优化
    kwcheckout.start_pc_show_py    1
    #.先删除物流
    kwshipping.del_all_shipping_py
    #.添加一个重量运费的物流
    kwshipping.add_shipping_py    0    1
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    Sleep    2
    #.选择中国
    Select From List    ${locatorB_checkout_address_select_country}    China
    Sleep    3
    ${res}    Get Text    dom:document.querySelectorAll(".fl")[4]
    Should Be True    '${res}'=='Freight Standard shipping'
    #.关闭PC优化
    kwcheckout.start_pc_show_py

checkout_087
    [Documentation]    验证B端运费方案设置数量范围时，C端购买的商品数量满足此数量范围，checkout shipping页面将展示此运费方案 > "1.C端购买5件商品进入checkout shipping页面,2.选择国家：中国,3.查看shipping delivery栏运费方案" >运费方案中显示 数量方案1
    [Tags]    P0    threshold    smoke
    #.开启pc优化
    kwcheckout.start_pc_show_py    1
    #.先删除物流
    kwshipping.del_all_shipping_py
    #.添加一个重量运费的物流
    kwshipping.add_shipping_py    0    2
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    Sleep    2
    #.选择中国
    Select From List    ${locatorB_checkout_address_select_country}    China
    Sleep    3
    ${res}    Get Text    dom:document.querySelectorAll(".fl")[4]
    Should Be True    '${res}'=='Quantity Standard shipping'
    #.关闭PC优化
    kwcheckout.start_pc_show_py

# -------------------------------------------------------------------------------- old -----------------------------------------------------------------------------------

*** Keywords ***
Checkout_Common_Show_Element
    [Documentation]    封装 进入checkout界面 显示购买的商品，地址......
    [Arguments]    ${click_element}    ${check_elements}
    Checkout Common Setp
    Wait And Click Element    ${click_element}
    Wait Until Page Contains Locator    ${check_elements}

Checkout Common Step
    #.登陆
    Login With Default User
    #.添加中国的物流
    kwshipping.add_shipping_py
    #.添加一个上架商品
    kwproduct.add_one_product_with_sub_py
    #.关闭PC优化
    kwcheckout.start_pc_show_py


Click Preview Step
    [Documentation]    点击预览的公共步骤
    Go To Product Management Page
    Sleep Time
    Wait And Click Element    ${locatorB_productsMgmt_icon_preview}
    Sleep Time
    Select Window    New
    Sleep Time

Common Teardown
    [Documentation]    结束公共步骤
    Close Test Suite Browser
    kwshipping.delShipping_py
   