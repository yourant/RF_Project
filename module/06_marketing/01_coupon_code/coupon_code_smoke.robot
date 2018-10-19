*** Settings ***
Documentation     测试商品列表
Suite Setup       Coupon Code Suite Setup
Suite Teardown    Coupon Code Suite Teardown
Test Setup        Coupon Code Case Setup
Test Teardown     Teardown Test Case
Force Tags        coupon code
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
coupon_code070
    [Documentation]    验证新建优惠码界面，活动名称输入框输入合法内容可保存成功
    [Tags]    P0    threshold    smoke
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityName}
    Should Be Equal    ${text}    activity_auto

coupon_code076
    [Documentation]    验证新建优惠码界面，优惠类型选择折扣券时可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityName}
    Should Be Equal    ${text}    activity_auto

coupon_code078
    [Documentation]    验证新建优惠码界面，优惠类型选择代金券时可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityName}
    Should Be Equal    ${text}    activity_auto

coupon_code082
    [Documentation]    验证新建优惠码界面，时间选择器中选择合法时间，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto1
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_start}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${empty}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    2018-10-30 20:00:00
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_end}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_endInput}    ${empty}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_endInput}    2018-11-30 20:00:00
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityTime}
    Should Be Equal    ${text}    2018-10-30 20:00:00-\n2018-11-30 20:00:00

coupon_code085
    [Documentation]    验证新建优惠码界面，勾选不限结束时间，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto1
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_start}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${empty}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    2018-10-30 20:00:00
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    #.判断
    ${class} =    Get Element Attribute    ${locatorB_couponCodeNew_selectTime_notEndTimeStart}    class
    Run Keyword If    '${class}'=='ant-checkbox ant-checkbox-checked'    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_notEndTime}
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityTime}
    Should Be Equal    ${text}    2018-10-30 20:00:00-\n无期限

coupon_code090
    [Documentation]    验证新建优惠码界面，优惠码输入框中输入合法内容可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto1
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_start}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${empty}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    2018-10-30 20:00:00
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_promoCode}    ${empty}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_promoCode}    AAAAAA
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_couponCode}
    Should Be Equal    ${text}    AAAAAA

coupon_code098
    [Documentation]    验证新建优惠码界面，数量输入框中输入合法内容时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    youhuoquan noLimit
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_start}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${empty}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    2018-10-30 20:00:00
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_num}    ${empty}
    Wait And Click Element    ${locatorB_couponCodeNew_input_noLimit}
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityName}
    Should Be Equal    ${text}    youhuoquan noLimit

coupon_code099
    [Documentation]    验证新建优惠码界面，数量栏，勾选输入框下方的不限时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    youhuoquan noLimit
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_start}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${empty}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    2018-10-30 20:00:00
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_num}    ${empty}
    Wait Until Element Is Visible    ${locatorB_couponCodeNew_selectTime_confirm}     10
    ${class} =    Get Element Attribute    ${locatorB_couponCodeNew_selectTime_notEndTimeStart}    class
    Run Keyword If    '${class}'=='ant-checkbox'    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}

    Wait And Click Element    ${locatorB_couponCodeNew_input_noLimit}
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityName}
    Should Be Equal    ${text}    youhuoquan noLimit


coupon_code107
    [Documentation]    验证新建优惠码界面，每人限用输入框中输入合法内容时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto1
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_start}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${empty}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    2018-10-30 20:00:00
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_num}    20
    Wait And Click Element    ${locatorB_button_save00}

    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityName}
    Should Be Equal    ${text}    youhuoquan num



coupon_code153
    [Documentation]    验证新建优惠码界面，选择商品窗口，选择商品后，添加按钮可点击
    [Tags]    P0    threshold    smoke
    kwproduct.del_all_products_py
    kwproduct.add_max_product_py
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Click Element    ${locatorB_couponCodeNew_button_chooseSomeProducts}
    Wait And Click Element    ${locatorB_couponCodeNew_icon_continueToAdd}
    Wait Exist And Click Element    ${locatorB_popUps_checkbox}
	Wait And Click Element    ${locatorB_popUps_button_footermiddle}
    Text Of Element Should Be Equal With Wait    ${locatorB_couponCodeNew_text_hadAdded}    已选择1件商品
    Wait Until Page Contains Locator    ${locatorB_couponCodeNew_items_listProduct}

coupon_code155
    [Documentation]    验证新建优惠码界面，选择商品窗口，商品可展开
    [Tags]    P0    threshold    smoke
    kwproduct.del_all_products_py
    kwproduct.add_max_product_with_sub_py
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Click Element    ${locatorB_couponCodeNew_button_chooseSomeProducts}
    Wait And Click Element    ${locatorB_couponCodeNew_icon_continueToAdd}
    Wait Exist And Click Element    ${locatorB_popUps_icon_down}[0]
    Wait Until Page Contains Text    red min
    Wait Until Page Contains Text    red mid
    Wait Until Page Contains Text    black min
    Wait Until Page Contains Text    black mid

coupon_code164
    [Documentation]    验证活动编辑界面，修改任何内容可触发保存和取消按钮
    [Tags]    P0    threshold    smoke
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto
    Wait Until Page Contains Locator    ${locatorB_button_save00}
    Wait Until Page Contains Locator    ${locatorB_button_canecl00}

coupon_code164.1
    [Documentation]    验证活动编辑界面，修改任何内容可触发保存和取消按钮
    [Tags]    P0    threshold    smoke
    kwcoupon.add_doing_coupon_code_py
    Reload Page And Start Ajax
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto
    Wait Until Page Contains Locator    ${locatorB_button_save00}
    Wait Until Page Contains Locator    ${locatorB_button_canecl00}

coupon_code165
    [Documentation]    验证新建优惠码界面，取消按钮可撤销操作
    [Tags]    P0    threshold    smoke
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto
    Wait And Click Element    ${locatorB_button_canecl00}
    Wait And Click Element    ${locatorB_popUps_button_footermiddle}
    Wait Until Page Contains Text    新建活动

coupon_code169
    [Documentation]    验证新建优惠码，优惠码不可重复
    [Tags]    P0    threshold    smoke
    Sleep    1
    ${code}    get_coupon_code_random_code_py
    &{conf} =    Create Dictionary
    ...    code=${code}
    kwcoupon.add_before_coupon_code_py    ${conf}
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_items_listCoupon}[1]
    Wait And Input Text    ${locatorB_couponCodeNew_input_couponCode}    ${code}
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains Text    优惠码重复


