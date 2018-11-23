*** Settings ***
Documentation     navigation

Resource          kw_common.robot

*** keyword ***
Go To Home Page
    [Documentation]    跳转到主页
    Wait And Click Element    ${locatorB_overview}
    Sleep    1

Go To Setting Page
    [Documentation]    跳转到设置页面
    Wait And Click Element    ${locatorB_setting}
    Sleep    1

Go To Dealing Order Page
    [Documentation]    跳转到待处理订单页面
    Wait Until Element Is Visible    ${locatorB_products}
    ${attr}    Run Keyword And Return Status    Wait Until Page Contains Locator     ${isExistB_setting_orderMenus_expanded}    5    #.获取导航栏订单的下拉按钮元素
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_order}
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_order_dealing}
    ...    ELSE    Wait And Click Element    ${locatorB_order_dealing}
    Wait Until Page Contains    待处理订单
#    Location Should Be    ${url_order_dealing}
    Sleep    1

Go To Undeal Order Page
    [Documentation]    跳转到未完成订单页面
    Wait Until Element Is Visible    ${locatorB_products}
    ${attr}    Run Keyword And Return Status    Wait Until Page Contains Locator     ${isExistB_setting_orderMenus_expanded}    5    #.获取导航栏订单的下拉按钮元素
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_order}
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_order_undeal}
    ...    ELSE    Wait And Click Element    ${locatorB_order_undeal}
    Wait Until Page Contains    未完成订单
#    Location Should Be    ${url_order_undeal}
    Sleep    1

Go To Product Management Page
    [Documentation]    跳转到商品管理页面
    Wait Until Element Is Visible    ${locatorB_products}
    ${attr}    Run Keyword And Return Status    Wait Until Page Contains Locator     ${isExistB_setting_productMenus_expanded}    5    #.获取导航栏商品的下拉按钮元素
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_products}
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_product_management}
    ...    ELSE    Wait And Click Element    ${locatorB_product_management}
    Wait Until Page Contains    商品管理
#    Location Should Be    ${url_products}
    Sleep    1

Go To Product Collection Page
    [Documentation]    跳转到商品专辑页面
    Wait Until Element Is Visible    ${locatorB_products}
    ${attr}    Run Keyword And Return Status    Wait Until Page Contains Locator     ${isExistB_setting_productMenus_expanded}    5
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_products}
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_product_collection}
    ...    ELSE    Wait And Click Element    ${locatorB_product_collection}
    Wait Until Page Contains    商品专辑
#    Location Should Be    ${url_collection}
    Sleep    1

Go To Product Review Page
    [Documentation]    跳转到商品评论页面
    Wait Until Element Is Visible    ${locatorB_products}
    ${attr}    Run Keyword And Return Status    Wait Until Page Contains Locator     ${isExistB_setting_productMenus_expanded}    5
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_products}
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_product_reviews}
    ...    ELSE    Wait And Click Element    ${locatorB_product_reviews}
    Wait Until Page Contains    商品评论
#    Location Should Be    ${url_reviews}
    Sleep    1

Go To Subtraction Page
    [Documentation]    跳转营销-满减活动页面
    Wait Until Element Is Visible    ${locatorB_marketing}
    # 若营销按钮没展开，则展开营销按钮
    ${attr}    Run Keyword And Return Status    Wait Until Page Contains Locator     ${isExistB_setting_marketingMenus_expanded}    5
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_marketing}
    ...    ELSE    Wait And Click Element    ${locatorB_marketing_subtraction}
    Wait Until Page Contains    ${locatorB_subtraction_header_text}
#    Location Should Be    ${url_subtraction}
    Sleep    1

Go To Coupon Page
    [Documentation]    跳转营销-优惠券页面
    Wait Until Element Is Visible    ${locatorB_marketing}
    # 若营销按钮没展开，则展开营销按钮
    ${attr}    Run Keyword And Return Status    Wait Until Page Contains Locator     ${isExistB_setting_marketingMenus_expanded}    5
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_marketing}
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_marketing_coupon_code}
    ...    ELSE    Wait And Click Element    ${locatorB_marketing_coupon_code}
    Wait Until Page Contains    ${locatorB_couponLst_couponText}
#    Location Should Be    ${url_coupon_code}
    Sleep    1

Go To Store Page
    [Documentation]    跳转基础信息页面
    Wait Until Element Is Visible    ${locatorB_setting}
    # 若营销按钮没展开，则展开营销按钮
    ${attr}    Run Keyword And Return Status    Wait Until Page Contains Locator     ${isExistB_setting_settingMenus_expanded}    5
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_setting}
    Run Keyword If    '${attr}'=='False'    Sleep    4
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_setting_store}
    ...    ELSE    Wait And Click Element    ${locatorB_setting_store}
    Wait Until Page Contains    ${contextB_store_storeInfo}
#    Location Should Be    ${url_coupon_store}
    Sleep    1

Go To Tax Page
    [Documentation]    跳转到税费页面
    Wait Until Element Is Visible    ${locatorB_setting}
    # 若设置按钮没展开，则展开设置按钮
    ${attr}    Run Keyword And Return Status    Wait Until Page Contains Locator     ${isExistB_setting_settingMenus_expanded}    5
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_setting}
    Run Keyword If    '${attr}'=='False'    Sleep    4
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_setting_taxPrice}
    ...    ELSE    Wait And Click Element    ${locatorB_setting_taxPrice}
    Wait Until Page Contains    收税方式
#    Location Should Be    ${url_tax_price}
    Sleep    1

Go To Shipping Page
    [Documentation]    跳转到物流页面
    Wait Until Element Is Visible    ${locatorB_setting}
    ${attr}    Run Keyword And Return Status    Wait Until Page Contains Locator     ${isExistB_setting_settingMenus_expanded}    5
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_setting}
    Run Keyword If    '${attr}'=='False'    Sleep    4
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_setting_shipping}
    ...    ELSE    Wait And Click Element    ${locatorB_setting_shipping}
    Wait Until Page Contains    物流方案
#    Location Should Be    ${url_shipping}
    Sleep    1

Go To Employee Account Page
    [Documentation]    跳转员工账号页面
    Wait Until Element Is Visible    ${locatorB_setting}
    ${attr}    Run Keyword And Return Status    Wait Until Page Contains Locator     ${isExistB_setting_settingMenus_expanded}    5
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_setting}
    Run Keyword If    '${attr}'=='False'    Sleep    4
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_setting_employee}
    ...    ELSE    Wait And Click Element    ${locatorB_setting_employee}
    Wait Until Page Contains    ${contextB_account_employeeManagement}
#    Location Should Be    ${url_accounts}
    Sleep    1

Go To Files Page
    [Documentation]    跳转到 文件管理页面
    Wait Until Element Is Visible    ${locatorB_setting}
    # 若设置按钮没展开，则展开设置按钮
    ${attr}    Run Keyword And Return Status    Wait Until Page Contains Locator     ${isExistB_setting_settingMenus_expanded}    5
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_setting}
    Run Keyword If    '${attr}'=='False'    Sleep    4
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_setting_files}
    ...    ELSE    Wait And Click Element    ${locatorB_setting_files}
    Wait Until Page Contains    上传文件
#    Location Should Be    ${url_files}
    Sleep    1

Go To Checkout Settings Page
    [Documentation]    跳转到店铺装修-结账流程页面
    Wait Until Element Is Visible    ${locatorB_setting}
    # 若设置按钮没展开，则展开设置按钮
    ${attr}    Run Keyword And Return Status    Wait Until Page Contains Locator     ${isExistB_setting_decorationMenus_expanded}    5
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_decoration}
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_decoration_checkoutSettings}
    ...    ELSE    Wait And Click Element    ${locatorB_decoration_checkoutSettings}
    Wait Until Page Contains    交易规则
#    Location Should Be    ${url_checkoutSettings}
    Sleep    1

Go To Navigation Menu Page
    [Documentation]    跳转到店铺装修-菜单导航
    Wait Until Element Is Visible    ${locatorB_setting}
    # 若设置按钮没展开，则展开设置按钮
    ${attr}    Run Keyword And Return Status    Wait Until Page Contains Locator     ${isExistB_setting_decorationMenus_expanded}    5
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_decoration}
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_decoration_navigationMenu}
    ...    ELSE    Wait And Click Element    ${locatorB_decoration_navigationMenu}
    Wait Until Page Contains    菜单导航
#    Location Should Be    ${url_menus}
    Sleep    1


Go To Home By Url
    [Documentation]    通过url跳转到主页
    Sleep    1
    Go To    ${home_page}
    Sleep    1

Go To Shipping Page By Url
    [Documentation]    通过url跳转到物流页面
    Sleep    1
    Go To    ${url_shipping}
    Sleep    1

Go To Payment Channel
    [Documentation]    跳转到 收款渠道页面
    Wait Until Element Is Visible    ${locatorB_setting}
    # 若设置按钮没展开，则展开设置按钮
    ${attr}    Run Keyword And Return Status    Wait Until Page Contains Locator     ${isExistB_setting_settingMenus_expanded}    5
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_setting}
    Run Keyword If    '${attr}'=='False'    Sleep    4
    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_setting_payment}
    ...    ELSE    Wait And Click Element    ${locatorB_setting_payment}
    Wait Until Page Contains    PayPal收款
#    Location Should Be    ${url_pay}
    Sleep    1

Go To Custom Page
    [Documentation]    通过url跳转到 自定义页面
    Sleep    1
    Go To    ${url_page}
    Sleep    1

Go To Application Page
    [Documentation]    通过url跳转到 图片seo
    Sleep    1
    Go To    ${url_img_seo}
    Sleep    1
