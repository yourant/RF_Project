*** Settings ***
Documentation     开启“货到付款”支付方式，进入支付界面时可以看到"货到付款"这个支付方式
Suite Setup       Products Suite Setup
Suite Teardown    Products Suite Teardown
Test Setup        Products Test Case Setup
Test Teardown     Products Test Case Teardown
Force Tags        Checkout
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_products.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_products.robot

*** Test Cases ***
Open_Cash_On_Delivery
    [Documentation]    开启“货到付款”支付方式，在支付界面显示“货到付款”的支付方式（若之前货到付款是开启的，把支持货到付款的物流方案都删除，则会自动关闭”货到付款“的支付方式）
    [Tags]    P0
    #---------------------------------前提环境：要去后台结账设置中选择在结账时要填写的内容，像first_name等--------------------------------------
    Go TO    ${home_page}
    #获取店铺名称
    Wait Until Page Contains Element    dom:document.querySelectorAll(".greeting_txt___2NI7k")[1]
    ${store_name}    Get Text    dom:document.querySelectorAll(".greeting_txt___2NI7k")[1]
    Go To Products Page
    Sleep    2
    #获取第一个商品名称
    Assign id To Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #进入设置-收款渠道，开启货到付款
    Open_Cash
    Go To Products Page
    Select_Order_Page    ${title}
    Complete_Order_Message
    #应该包含货到付款等字样
    Page Should Contain    Cash on Delivery

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,每次预览时都新增一个上架商品
    Login With Test Account
    Start Ajax Listener
    Add Product_Up
    Sleep    8
    Go To Products Page

Products Suite Teardown
    [Documentation]    删除商品
    Select Window    店匠科技
    Go To Products Page
    Delete_First_Product
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
