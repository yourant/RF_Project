*** Settings ***
Suite Setup       Open Test Browser    ${home_page}
Suite Teardown    Close Test Suite Browser
Test Setup        Login Testcase Setup
Test Teardown     Teardown Test Case
Force Tags        logout
Resource          ../../resources/variable/var_common.robot
Resource          ../../resources/keywords/kw_common.robot
Resource          ../../resources/keywords/kw_browser.robot
Resource          ../../resources/variable/var_login.robot
Resource          ../../resources/keywords/kw_login.robot
Library           SeleniumLibrary    run_on_failure=NOTHING


*** Test Cases ***
logout001
    [Documentation]     退出登录成功
    [Tags]    P0    threshold
    Wait And Input Text     ${locatorB_login_input_account}    ${user_default_contact}
    Wait And Input Password    ${locatorB_login_input_password}    ${user_default_pwd}
    Wait And Click Element    ${locatorB_login_btn_login}
    Wait Until Page Contains Locator    ${locatorB_order}
    Logout
    Wait Until Page Contains Locator    ${locatorB_login_input_account}