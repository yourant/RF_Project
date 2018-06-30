*** Settings ***
Documentation     此时第一个商品下有两个子产品，在点击pay now按钮之前，删除当前第一个商品下的所有子商品（一共有两个子产品），支付失败
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
Change_Status
    [Documentation]    此时第一个商品下有两个子产品，在点击pay now按钮之前，删除当前第一个商品下的所有子商品（一共有两个子产品），支付失败
    [Tags]    P0
    #-----------------------------------------选中一个有子商品的商品，进入到支付页面------------------------------------------
    #获取店铺名称
    ${store_name}    Get Text    dom:document.querySelectorAll(".greeting_txt___2NI7k")[1]
    #获取第一个商品名称
    Assign id To Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #给该商品增加子产品
    Add_Sub_Product_With_Already_Product
    Select_Order_Page_With_Sub_Product    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个有子商品的商品，进入到支付页面------------------------------------------
    #返回后台删除该商品的所有子商品
    Select Window    店匠科技
    Delete_All_Sub_Product_With_Already_Product
    Select Window    title=${store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.

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
