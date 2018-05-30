*** Settings ***
Library           customLibrary
Resource          ../../resources/shipping.robot

*** Variables ***
${page_list_api}    http://admin1024.shoplazza.com/api/shipping/list

*** Test Cases ***
092_shipping
    #创建物流    没有输入 方案名 点击保存
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    sleep    1
    Wait Until Element Is Visible    id:test_save_btn
    click link    id:test_save_btn
    page should contain element    class:ant-form-explain
    close browser

093_shipping
    #创建物流    输入 方案名 点击保存 提示 请添加国家
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    sleep    1
    input text    id:name    方案1
    Wait Until Element Is Visible    id:test_save_btn
    click link    id:test_save_btn
    sleep    2
    page should not contain element    id:test_add_btn
    close browser

094_shipping
    #创建物流    除了价格运费不添加，其他照常添加    提示请添加价格运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    sleep    1
    ${name}    salt
    input text    id:name    ${name}
    Wait Until Element Is Visible    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_sure_btn
    execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0].click()
    execute javascript    return document.getElementsByClassName("ant-tree-checkbox-inner")[1].click()
    sleep    1
    click button    id:test_shipping_country_modal_sure_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    ${input}    set variable    重量运费
    ${desc}    set variable    重量运费说明
    ${range_min}    set variable    10
    ${range_max}    set variable    100
    ${rate_amount}    set variable    9
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll("#name")[1]    ${input}
    input text    dom:document.querySelectorAll("#desc")[0]    ${desc}
    input text    id:range_min    ${range_min}
    input text    id:range_max    ${range_max}
    input text    id:rate_amount    ${rate_amount}
    sleep    1
    click button    id:test_shipping_edit_modal_sure_btn
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${input_a}    set variable    数量运费
    ${desc_a}    set variable    熟练给运费说明
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
    page should contain element    id:test_add_btn
    close browser

095_shipping
    #创建物流    只添加数量运费，重量和价格运费不添加，其他照常添加
    ${xpath_d}    set variable    id:test_add_btn
    ${range_min}    set variable    10
    ${range_max}    set variable    100
    ${rate_amount}    set variable    9
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    sleep    1
    ${name}    salt
    input text    id:name    ${name}
    Wait Until Element Is Visible    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_sure_btn
    execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0].click()
    execute javascript    return document.getElementsByClassName("ant-tree-checkbox-inner")[1].click()
    sleep    1
    click button    id:test_shipping_country_modal_sure_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${input_a}    set variable    数量运费
    ${desc_a}    set variable    熟练给运费说明
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
    page should contain element    id:test_add_btn
    close browser

096_shipping
    #创建物流    添加中国    > 点击后显示弹窗，显示中国的所有省份并全部处于勾选状态
    ${xpath_d}    set variable    id:test_add_btn
    ${range_min}    set variable    10
    ${range_max}    set variable    100
    ${rate_amount}    set variable    9
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    sleep    1
    ${name}    salt
    input text    id:name    ${name}
    Wait Until Element Is Visible    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_sure_btn
    execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[2].click()
    execute javascript    return document.getElementsByClassName("ant-tree-checkbox-inner")[10].click()
    sleep    1
    click button    id:test_shipping_country_modal_sure_btn
    sleep    1
    execute javascript    return document.querySelectorAll("#test_shipping_country_edit_icon")[0].click()
    sleep    1
    ${count}    execute javascript    return document.querySelectorAll(".ant-modal-body ul li").length
    Run keyword If    ${count}==32    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain    dddss

097_shipping
    #创建物流    添加中国    弹出删除窗口
    ${xpath_d}    set variable    id:test_add_btn
    ${range_min}    set variable    10
    ${range_max}    set variable    100
    ${rate_amount}    set variable    9
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    sleep    1
    Wait Until Element Is Visible    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_sure_btn
    execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[2].click()
    execute javascript    return document.getElementsByClassName("ant-tree-checkbox-inner")[10].click()
    sleep    1
    click button    id:test_shipping_country_modal_sure_btn
    sleep    1
    execute javascript    return document.querySelectorAll("#test_shipping_country_delete_icon")[0].click()
    sleep    2
    page should contain element    id:test_delete_modal_sure_btn
    close browser
