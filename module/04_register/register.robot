*** Settings ***
Suite Setup       Register Suite Setup
Suite Teardown    Close Test Suite Browser
#Test Setup
Test Teardown     Teardown Test Case
Force Tags        Register
Library           SeleniumLibrary
Library           ${CURDIR}/../../lib/customLibrary
Resource          ../../resources/variable/var_common.robot
Resource          ../../resources/keywords/kw_common.robot
Resource          ../../resources/keywords/kw_browser.robot
Resource          ../../resources/variable/var_login.robot

*** Test Cases ***
register_001
    [Documentation]    注册
    [Tags]    P0
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait And Input Text    ${locatorB_login_input_inviteCode}    ${user_default_inviteCode}
    Wait And input text    ${locatorB_login_input_domain}    ${register_domain}
    Wait And input password    ${locatorB_login_input_password}    ${register_pwd}
    Wait And input password    ${locatorB_login_input_confirmPwd}    ${register_pwd}
    Wait And input text    ${locatorB_login_input_account}    ${register_user}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Sleep    2
    ${code}    Get Latest Vcode Fromdb    ${register_user}
    Wait And input text    ${locatorB_login_input_vcode}    ${code}
    Wait And Click Element    dom:document.querySelectorAll("span[class='ant-checkbox']")[0]    #.点击我接受
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Wait Until Page Contains Element    ${locatorB_order}
    Logout

register_002
    [Documentation]    注册 输入已注册的账号 提示错误
    [Tags]    P0
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    Input Text    ${locatorB_login_input_inviteCode}    ${register_code}
    input text    ${locatorB_login_input_domain}    ${register_domain}
    input password    ${locatorB_login_input_password}    ${register_pwd}
    input password    ${locatorB_login_input_confirmPwd}    ${register_pwd}
    input text    ${locatorB_login_input_account}    ${register_user}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-message-notice-content")[0]
    Close Browser

register_005
    [Documentation]    注册 输入格式错误的域名 提示错误
    [Tags]    P0
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    Input Text    ${locatorB_login_input_inviteCode}    ${register_code}
    input text    ${locatorB_login_input_domain}    @!@$1
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_006
    [Documentation]    注册 域名为空 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    Input Text    ${locatorB_login_input_inviteCode}    ${register_code}
    input text    ${locatorB_login_input_domain}    ${Empty}
    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-input")[0].click()    #.点击同意
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_007
    [Documentation]    注册 输入未注册的域名 密码为空 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    Input Text    ${locatorB_login_input_inviteCode}    ${register_code}
    input text    ${locatorB_login_input_domain}    lalala
    input text    ${locatorB_login_input_account}    ${register_user}
    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-input")[0].click()    #.点击同意
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_008
    [Documentation]    注册 输入未注册的域名 密码5位 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    Input Text    ${locatorB_login_input_inviteCode}    ${register_code}
    input text    ${locatorB_login_input_domain}    lalala
    input password    ${locatorB_login_input_password}    12345
    input password    ${locatorB_login_input_confirmPwd}    12345
    input text    ${locatorB_login_input_account}    ${register_user}
    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-input")[0].click()    #.点击同意
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_009
    [Documentation]    注册 输入未注册的域名 密码13位 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    Input Text    ${locatorB_login_input_inviteCode}    ${register_code}
    input text    ${locatorB_login_input_domain}    lalala
    input password    ${locatorB_login_input_password}    12345123456783
    input password    ${locatorB_login_input_confirmPwd}    12345123456783
    input text    ${locatorB_login_input_account}    ${register_user}
    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-input")[0].click()    #.点击同意
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_010
    [Documentation]    注册 输入未注册的域名 密码6位 确认密码为空 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    Input Text    ${locatorB_login_input_inviteCode}    ${register_code}
    input text    ${locatorB_login_input_domain}    lalala
    input password    ${locatorB_login_input_password}    1234512345678
    input password    ${locatorB_login_input_confirmPwd}    ${Empty}
    input text    ${locatorB_login_input_account}    ${register_user}
    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-input")[0].click()    #.点击同意
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_011
    [Documentation]    注册 输入未注册的域名 2次密码输入不一致 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    Input Text    ${locatorB_login_input_inviteCode}    ${register_code}
    input text    ${locatorB_login_input_domain}    lalala
    input password    ${locatorB_login_input_password}    123451234
    input password    ${locatorB_login_input_confirmPwd}    987654321
    input text    ${locatorB_login_input_account}    ${register_user}
    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-input")[0].click()    #.点击同意
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_013
    [Documentation]    注册 输入未注册的域名-密码 错误格式账号 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    Input Text    ${locatorB_login_input_inviteCode}    ${register_code}
    input text    ${locatorB_login_input_domain}    lalala
    input password    ${locatorB_login_input_password}    123451234
    input password    ${locatorB_login_input_confirmPwd}    123451234
    input text    ${locatorB_login_input_account}    2$$%%@1q
    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-input")[0].click()    #.点击同意
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_014
    [Documentation]    注册 输入未注册的域名-密码 账号为空 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    Input Text    ${locatorB_login_input_inviteCode}    ${register_code}
    input text    ${locatorB_login_input_domain}    lalala
    input password    ${locatorB_login_input_password}    123451234
    input password    ${locatorB_login_input_confirmPwd}    123451234
    input text    ${locatorB_login_input_account}    ${Empty}
    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-input")[0].click()    #.点击同意
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_015
    [Documentation]    注册 输入未注册的域名-密码 验证码错误 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    Input Text    ${locatorB_login_input_inviteCode}    ${register_code}
    input text    ${locatorB_login_input_domain}    lalala
    input password    ${locatorB_login_input_password}    123451234
    input password    ${locatorB_login_input_confirmPwd}    123451234
    input text    ${locatorB_login_input_account}    ${register_user}
    #Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Input Text    ${locatorB_login_input_vcode}    999999
    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-input")[0].click()    #.点击同意
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-message-notice-content")[0]
    Close Browser

register_017
    [Documentation]    注册 输入未注册的域名-密码 验证码4位数 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    Input Text    ${locatorB_login_input_inviteCode}    ${register_code}
    input text    ${locatorB_login_input_domain}    lalala
    input password    ${locatorB_login_input_password}    123451234
    input password    ${locatorB_login_input_confirmPwd}    123451234
    input text    ${locatorB_login_input_account}    ${register_user}
    #Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Input Text    ${locatorB_login_input_vcode}    9999
    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-input")[0].click()    #.点击同意
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_018
    [Documentation]    注册 输入未注册的域名-密码 验证码为空 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    Input Text    ${locatorB_login_input_inviteCode}    ${register_code}
    input text    ${locatorB_login_input_domain}    lalala
    input password    ${locatorB_login_input_password}    123451234
    input password    ${locatorB_login_input_confirmPwd}    123451234
    input text    ${locatorB_login_input_account}    ${register_user}
    #Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Input Text    ${locatorB_login_input_vcode}    ${Empty}
    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-input")[0].click()    #.点击同意
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_019
    [Documentation]    登陆成功,然后退出登陆
    [Tags]    P0
    Comment    wait until login button is visible
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${locatorB_login_btn_login}
    Input Text    ${locatorB_login_input_account}    ${register_user}
    Input Password    ${locatorB_login_input_password}    ${register_pwd}
    #Wait And Click Element    ${locatorB_login_btn_login}
    #Wait Until Element Is Visible    ${locatorB_login_input_domain}
    #Input Text    ${locatorB_login_input_domain}    ${register_domain}
    Wait And Click Element    ${locatorB_login_btn_login}
    Sleep    1
    Page Should Contain Element    ${locatorB_order}
    Wait And Click Element    dom:document.querySelectorAll(".hd-line-center")[0]
    Execute JavaScript    return document.querySelectorAll(".account_content___18o60 a")[1].click()
    Close Browser

*** Keywords ***
Register Suite Setup
    Open Test Browser    ${home_page}
    Del User Fromdb    ${register_user}