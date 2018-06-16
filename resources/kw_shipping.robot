*** Settings ***
Documentation     添加物流
Library           SeleniumLibrary
Library           ${CURDIR}/../lib/customLibrary
Resource          var_common.robot
Resource          var_shipping.robot
Resource          kw_browser.robot
Resource          kw_login.robot

*** Variable ***
${input}          重量运费
${desc}           重量运费说明
${range_min}      10
${range_max}      100
${rate_amount}    9
${input_a}        数量运费
${desc_a}         数量运费说明

*** keyword ***
Add Shipping
    Go To Shipping Page
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    Sleep    1
    click element    ${locator_shipping_add_shipping}
    Sleep    1
    input text    id:name    ${content_shipping_name}    #.物流名称
    Wait Until Element Is Visible    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_sure_btn
    click element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]
    Wait Until Page Contains    Algeria
    Sleep    1
    click element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    sleep    1
    click button    id:test_shipping_country_modal_sure_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll("#name")[1]    ${input}
    input text    dom:document.querySelectorAll("#desc")[0]    ${desc}
    input text    id:range_min    ${range_min}
    input text    id:range_max    ${range_max}
    input text    id:rate_amount    ${rate_amount}
    sleep    1
    click button    id:test_shipping_edit_modal_sure_btn
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    Sleep    1
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll("#name")[1]    ${input_a}
    input text    dom:document.querySelectorAll("#desc")[0]    ${desc_a}
    input text    id:range_min    ${range_min}
    input text    id:range_max    ${range_max}
    input text    id:rate_amount    ${rate_amount}
    sleep    1
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    2
    click link    id:test_save_btn
    sleep    2
    Location Should Be    ${url_shipping}

Delete Shipping
    #.删除物流
    Go To Shipping Page
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    Click Element    ${locator_shipping_first_element}
    Wait Until Element Is Visible    ${locator_shipping_add_country}
    Sleep    1
    Execute JavaScript    return document.getElementById("dj").scrollTo(0,10000)
    Wait Until Element Is Visible    ${locator_shipping_del_shipping}
    Click Button    ${locator_shipping_del_shipping}
    Wait Until Element Is Visible    id:test_delete_modal_sure_btn
    Sleep    1
    Click Button    id:test_delete_modal_sure_btn
    Sleep    1
    Page Should Not Contain Element    ${locator_shipping_first_element}
    Location Should Be    ${url_shipping}

Quit Adding Shipping
    Wait Until Element is Visible    ${locator_setting_shipping}
    Click Element    ${locator_setting_shipping}
    Alert Should Be Present
