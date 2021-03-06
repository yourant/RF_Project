*** Settings ***
Documentation     checkout 公共方法
Resource          kw_common.robot

*** keywords ***
Navigation Suite Setup
    [Documentation]    布置开始执行用例环境
    Login With Default User

Navigation Suite Teardown
    kwmenus.del_all_menus_py
    Close Test Suite Browser

Navigation Test Setup
    [Documentation]    每个用例执行开始步骤
    kwmenus.del_all_menus_py
    Go To Navigation Menu Page

Navigation Test Teardown
    Teardown Test Case


Add Navigation Menu With Wait
    [Documentation]    添加一个菜单,只输入菜单名称
    [Arguments]    ${menuName}
    Sleep And Click Element    ${locatorB_menus_button_addMenu}
    Sleep    1
    Wait And Input Text    ${locatorB_menusAdd_input_menuName}     ${menuName}
    Sleep    2
    Sleep And Click Element    ${locatorB_button_save00}
    Sleep    2
    Wait Until Page Not Contains Locator    ${locatorB_button_save00}
    Go To Navigation Menu Page

Add All Navigation Menu With Wait
    [Documentation]    添加一个菜单,输入菜单名称和目录
    [Arguments]    ${menuName}    ${Content}
    Sleep And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Input Text    ${locatorB_menusAdd_input_menuName}     ${menuName}
    Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
    Wait And Input Text    ${locatorB_menusAdd_input_menuNavName}    ${Content}
    Sleep    2
    Sleep And Click Element    ${locatorB_button_save00}
    Sleep    2
    Wait Until Page Not Contains Locator    ${locatorB_button_save00}
    Go To Navigation Menu Page

Delete All Navigation Menu
    [Documentation]    删除所有菜单
    :FOR    ${ONE}    IN RANGE    9999
    \    ${status}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_menusAdd_link_delMenu}
    \    Exit For Loop If    '${status}'=='False'
    \    ${AllDelicon}    Get WebElements    ${locatorB_menusAdd_link_delMenu}
    \    Wait And Click Element Then Confirm    @{AllDelicon}[0]
    \    Reload Page And Start Ajax
