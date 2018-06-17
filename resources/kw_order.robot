*** Settings ***
Documentation     生成订单
Library           SeleniumLibrary
Library           ${CURDIR}/../lib/customLibrary
Resource          kw_browser.robot
Resource          kw_common.robot
Resource          var_common.robot
Resource          var_order.robot

*** Keywords ***
Add Order
    #.add order
    #C端将商品加入购入车再点击checkout 显示购买的商品，地址，买家留言，商品总价及提交按钮
    #.click products btn
    Go To Order Page
    Wait And Click Element    ${locator_order}
    #点击商品预览
    Sleep    3
    #获取第一个商品名称
    Assign id To Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #点击商品预览
    Assign id To Element    dom:document.querySelectorAll(".preview___37DtU")[0]    btn1
    Wait And Click Element    btn1
    #.第二个窗口
    Select Window    New
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]
    Wait And Click Button    id:submitMbPay
    Wait And Input Text    dom:document.querySelectorAll("input[name='first_name']")[0]    123
    Wait And Input Text    dom:document.querySelectorAll("input[name='last_name']")[0]    345
    Select From List    id:shipping_country_id    Afghanistan
    Wait And Input Text    dom:document.querySelectorAll("input[name='city']")[0]    深圳
    Wait And Input Text    dom:document.querySelectorAll("input[name='address']")[0]    深圳123
    Wait And Input Text    dom:document.querySelectorAll("input[name='zip']")[0]    123456
    Wait And Input Text    dom:document.querySelectorAll("input[name='email']")[0]    123456@zz.xx
    Wait And Input Text    dom:document.querySelectorAll("input[name='phone']")[0]    123456789
    Wait And Input Text    dom:document.querySelectorAll("input[name='company']")[0]    123456789
    Wait And Click Element    dom:document.querySelectorAll(".form-footer")[0]
    Wait And Click Button    id:submitMbPay
