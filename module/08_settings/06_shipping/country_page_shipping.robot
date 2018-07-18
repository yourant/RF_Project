*** Settings ***
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Force Tags        Shipping
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_shipping.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_shipping.robot
Library           customLibrary

*** Test Cases ***
shipping012
    [Documentation]    添加国家
    [Tags]    P0
    Go To Shipping Page
    Quit Add Country
    Wait And Click Element    ${locator_shipping_country_element}
    Wait And Click Element    ${locator_shipping_country_save_btn}
    Page Should Contain Element    ${locator_shipping_country_data}
    Quit All Shipping

shipping013
    [Documentation]    tax price page should be normal atfer login
    [Tags]    P0
    Go To Shipping Page
    Wait And Click Element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    Input Text    ${locator_shipping_first_input}    中国
    Sleep    1
    Wait And Click Button    dom:document.querySelectorAll("button")[1]
    Page Should Not Contain Element    ${locator_shipping_send_address}
    Quit All Shipping

shipping017
    [Documentation]    物流方案输入中
    [Tags]    P1
    Go To Shipping Page
    Wait And Click Element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    sleep    1
    input text    ${locator_shipping_first_input}    中
    Wait And Click Button    dom:document.querySelectorAll("button")[1]
    Page Should Not Contain Element    ${locator_shipping_send_address}
    Quit All Shipping

shipping018
    [Documentation]    物流方案输入 特殊字符
    [Tags]    P1
    Go To Shipping Page
    Wait And Click Element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    sleep    1
    input text    ${locator_shipping_first_input}    @#￥
    Wait And Click Button    dom:document.querySelectorAll("button")[1]
    Page Should Not Contain Element    ${locator_shipping_send_address}
    Quit All Shipping

shipping019
    [Documentation]    选择国家后 列表选中国家出现1
    [Tags]    P0
    Go To Shipping Page
    Quit Add Country
    Sleep    1
    Wait And Click Element    ${locator_shipping_country_select}
    Wait And Click Element    ${locator_shipping_country_nums}
    ${count}    get text    class:country_selected___2BYCm
    ${res}    searchStr    ${count}
    Should Be True    ${res}==1
    Wait And Click Element    ${locator_shipping_country_close_btn}

shipping022
    [Documentation]    选择国家后 列表出现对应的国家
    [Tags]    P0
    Go To Shipping Page
    Quit Add Country
    sleep    1
    Wait And Click Element    ${locator_shipping_country_select}
    Wait And Click Element    ${locator_shipping_country_nums}
    ${data}    execute javascript    return document.getElementsByClassName("info_cn___N00o6")[1].innerHTML
    Wait And Click Element    ${locator_shipping_country_save_btn}
    ${res}    get text    ${locator_shipping_country_get_other}
    Should Be True    '${data}'=='${res}'
    Quit All Shipping

shipping024
    [Documentation]    选择国家的`其他国家` 列表出现其他国家
    [Tags]    P0
    Go To Shipping Page
    Quit Add Country
    Sleep    1.5
    Execute JavaScript    ${locator_shipping_country_other}
    Wait And Click Element    ${locator_shipping_country_save_btn}
    ${res}    get text    ${locator_shipping_country_get_other}
    Should Be True    '${res}'=='其他国家'
    Quit All Shipping

shipping025
    [Documentation]    选择国家的随意一个国家 列表不会出现`其他国家`
    [Tags]    P0
    Go To Shipping Page
    Quit Add Country
    sleep    1.5
    Wait And Click Element    ${locator_shipping_country_select}
    Wait And Click Element    ${locator_shipping_country_nums}
    Wait And Click Element    ${locator_shipping_country_save_btn}
    ${res}    get text    ${locator_shipping_country_get_other}
    Should Be True    '${res}'<>'其他国家'
    Quit All Shipping

shipping027
    [Documentation]    选择国家不选国家 列表提示暂无数据
    [Tags]    P1
    Go To Shipping Page
    Sleep    1
    Quit Add Country
    Wait And Click Element    ${locator_shipping_country_close_btn}
    ${res}    Execute JavaScript    return document.querySelectorAll(".ant-table-placeholder span")[0].innerText
    #check data
    Should Be True    '${res}'=='暂无数据'
    Quit All Setp
