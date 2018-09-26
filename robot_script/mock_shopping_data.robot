*** Settings ***
Suite Setup       Open Test Browser    ${url}
#Suite Teardown    Close Test Suite Browser
#Test Setup        Login Testcase Setup
#Test Teardown     Teardown Test Case
Force Tags        mock_shopping_data
#Library           ${CURDIR}/../lib/customLibrary
#Library           ${CURDIR}/../lib/testKeyWord/testKeyWord
#Resource          ../resources/variable/var_common.robot
#Variables         ${CURDIR}/../lib/customlib/customkeywords.py
#Library           ${CURDIR}/../lib/customlib/customkeywords.py
Resource          ../resources/keywords/kw_browser.robot
Resource          ../resources/keywords/kw_common.robot
Resource          ../resources/keywords/kw_checkout.robot

*** Variables ***
${url}    https://jolly.myshoplaza.com
${btn_quickView}    dom:document.querySelectorAll('[class="normal_btn product_btn"]')[0]
${img}    dom:document.querySelectorAll('img')[0]
${btn_addToCart}    dom:document.querySelectorAll('[class="footer-submit normal_btn"]')[0]
${btn_buyNow}    dom:document.querySelectorAll('[class="footer-submit second_btn"]')[0]
${btn_continue_checkout_complete}    dom:document.querySelectorAll('[class="btn checkout-btn fr"]')[0]
${icon_credit_card}    dom:document.querySelectorAll('[class="djfont card-checkout-credit"]')[0]
${icon_cod}    dom:document.querySelectorAll('[class="djfont card-checkout-cash"]')[0]
${btn_pay_again}    dom:document.querySelectorAll('[class="btn pay-btn"]')[0]

${icon_cart}    dom:document.querySelectorAll('[class="djfont dj-cart"]')[0]
${btn_checkout}    dom:document.querySelectorAll('[class~="checkout"]')[0]
${input_search}    dom:document.querySelectorAll('[placeholder="Search for..."]')[0]


*** Testcases ***
AddToCart_Checkout_with_Credit_Card
	:FOR    ${i}    IN RANGE    5000
	\    kw_AddToCart_Checkout_with_Credit_Card
	\    Log    ${i}

BuyNow_with_Credit_Card
	:FOR    ${i}    IN RANGE    5000
    \    kw_BuyNow_with_Credit_Card
    \    Log    ${i}

Searching
	:FOR    ${i}    IN RANGE    400
	\    kw_Searching
	\    Log    ${i}


*** keyword ***
kw_AddToCart_Checkout_with_Credit_Card
	Run Keyword And Ignore Error    Delete Cookie    client_id
	Run Keyword And Ignore Error    Reload Page
	Run Keyword And Ignore Error    Mouse Over    ${img}
	Run Keyword And Ignore Error    Wait And Click Element    ${btn_quickView}
	Sleep    1
	Run Keyword And Ignore Error    Wait And Click Element    ${btn_addToCart}
	Sleep    1
	Run Keyword And Ignore Error    Wait And Click Element    ${icon_cart}
	Sleep    1
	Run Keyword And Ignore Error    Wait And Click Element    ${btn_checkout}
	Sleep    1
	Run Keyword And Ignore Error    Add Address Common Step
	Run Keyword And Ignore Error    Wait And Click Element    ${btn_continue_checkout_complete}
	Sleep    1
	Run Keyword And Ignore Error    Wait And Click Element    ${icon_credit_card}
	Run Keyword And Ignore Error    Add Credit Card Info
	Run Keyword And Ignore Error    Wait And Click Element    ${btn_continue_checkout_complete}
	Sleep    1
	Run Keyword And Ignore Error    Wait Until Page Contains Locator    ${btn_pay_again}
	Sleep    1
	Run Keyword And Ignore Error    Open New And Close Other Windows    ${url}

kw_BuyNow_with_Credit_Card
	Run Keyword And Ignore Error    Delete Cookie    client_id
	Run Keyword And Ignore Error    Reload Page
	Run Keyword And Ignore Error    Wait And Click Element    ${img}
	Run Keyword And Ignore Error    Wait And Click Element    ${btn_buyNow}
	Sleep    1
	Run Keyword And Ignore Error    Add Address Common Step
	Run Keyword And Ignore Error    Wait And Click Element    ${btn_continue_checkout_complete}
	Sleep    1
	Run Keyword And Ignore Error    Wait And Click Element    ${icon_cod}
	Run Keyword And Ignore Error    Wait And Click Element    ${btn_continue_checkout_complete}
	Sleep    1
	Run Keyword And Ignore Error    Wait Until Page Contains Text    Payment successful!
	Sleep    1
	Run Keyword And Ignore Error    Open New And Close Other Windows    ${url}

kw_Searching
	Run Keyword And Ignore Error    Delete Cookie    client_id
	Run Keyword And Ignore Error    Reload Page
#	Start Ajax Listener
	Run Keyword And Ignore Error    Wait And Input Text    ${input_search}    1111111
	Run Keyword And Ignore Error    Press Key    ${input_search}    ${keybord_enter}
	Sleep    1
	Run Keyword And Ignore Error    Wait Until Page Contains Text    Try something like.
#	Log Error Response Of Ajax Listener
#	Log Correct Response Of Ajax Listener
	Sleep    1
	Run Keyword And Ignore Error    Open New And Close Other Windows    ${url}

