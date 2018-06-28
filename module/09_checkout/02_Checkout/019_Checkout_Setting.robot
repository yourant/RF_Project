*** Settings ***
Documentation     修改结账设置
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

*** Variable ***
${tax_price}      1

*** Test Cases ***
Modify_Pay_Setting
    [Documentation]    进入到checkout页面后，填写完地址信息（邮箱）后，返回后台修改结账设置改为两者都需填写，再去checkout页面点击submit，页面将会刷新，地址信息将会变成两者都需填写
    [Tags]    P0
    #---------------------------------前提环境：要去后台结账设置中选择在结账时要填写的内容，像first_name等--------------------------------------
    Sleep    2
    #点击个人账户按钮，展现出店铺名称
    Wait And Click Element    dom:document.querySelectorAll(".xiala-choose")[0]
    Sleep    1
    #获取店铺名称
    ${store_name}    Get Text    dom:document.querySelectorAll(".name___2AVIS")[0]
    Sleep    2
    #获取第一个商品名称
    Assign id To Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #先设置成只需填写邮箱
    Modify_Set    0
    Sleep    5
    Go To Products Page
    #进入checkout页面
    Select_Order_Page    ${title}
    #填写完地址信息(只填写邮箱)，不点击提交按钮
    Complete_Order_Message_Not_Submit
    Sleep    2
    #进入后台，修改为填写手机和邮箱
    Select Window    店匠科技
    Sleep    1
    Modify_Set    2
    #跳回checkout页
    Select Window    title=${store_name}
    Sleep    1
    #点击submit按钮后，页面将刷新
    Wait And Click Element    id:submitMbPay
    Sleep    5
    #验证当前要填写的是不是手机和邮箱
    #点击添加地址信息
    Wait And Click Element    id:addAddress
    Sleep    1
    #手机
    Element Should Be Visible    dom:document.querySelectorAll("input[name=phone]")[0]
    #邮箱
    Element Should Be Visible    dom:document.querySelectorAll("input[name=email]")[0]

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,每次预览时都新增一个上架商品
    Login With Test Account
    Start Ajax Listener
    Add Product_Up
    Sleep    5
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
