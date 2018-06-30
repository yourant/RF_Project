*** Settings ***
Documentation     修改支付方式信息，支付成功后应该显示最新的支付信息(这里修改支付指示，对应的变动将会显示在支付成功页)
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

*** Variables ***
${tip}            This is payment tips!    # 支付提示

*** Test Cases ***
Change_Status
    [Documentation]    修改支付方式信息，支付成功后应该显示最新的支付信息(这里修改支付指示，对应的变动将会显示在支付成功页)
    [Tags]    P0
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #点击个人账户按钮，展现出店铺名称
    Wait And Click Element    dom:document.querySelectorAll(".xiala-choose")[0]
    #获取店铺名称
    ${store_name}    Get Text    dom:document.querySelectorAll(".name___2AVIS")[0]
    #获取第一个商品名称
    Assign id To Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    Select_Order_Page    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #修改“货到付款”的支付提示
    Select Window    店匠科技
    #------修改支付指示------
    Go TO    ${home_page}
    Sleep    2
    Go To Setting Page
    Sleep    5
    Execute Javascript    return document.getElementById("test_setting_pay").scrollIntoView()
    #点击收款渠道
    Execute Javascript    return document.getElementById("test_setting_pay").click()
    Sleep    5
    #点击货到付款下的编辑按钮
    Wait And Click Element    dom:document.querySelectorAll("#cod .default_btn___2wyTS")[0]
    Sleep    1
    Execute Javascript    return document.querySelectorAll("#cod .middle_btn___2ExQc")[0].scrollIntoView()
    Sleep    1
    #输入支付提示
    Wait And Input Text    id:method_tips    ${tip}
    #点击保存按钮
    Wait And Click Element    dom:document.querySelectorAll("#cod .middle_btn___2ExQc")[0]
    #------修改支付指示------
    Sleep    3
    Select Window    title=${store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.
    Page Should Contain    ${tip}

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
    Sleep    5
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
