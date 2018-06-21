*** Settings ***
Documentation     测试商品列表
Suite Setup       Products Suite Setup
Suite Teardown    Products Suite Teardown
Test Setup        Products Test Case Setup
Test Teardown     Products Test Case Teardown
Force Tags        Products
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_products.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_products.robot

*** Variables ***
${locator_page_total_record}    dom:document.querySelectorAll(".ant-pagination-total-text")[0]

*** Test Cases ***
Test_Products_List_Data
    [Documentation]    测试商品列表的展示（数量/标题/库存/SKU/浏览量/销量/上架状态/创建时间）
    [Tags]    P0
    # 接口返回的数量==页面展示的总条数
    ${total_record}=    Execute Javascript    return responseMap.get("${api_products_list}").data.total;
    ${total_record_str}=    Convert To String    ${total_record}
    Element Should Contain    ${locator_page_total_record}    ${total_record_str}
    # 然后遍历校验列表数据是否一致
    :FOR    ${index}    IN RANGE    ${total_record}
    \    ${table_row}=    Evaluate    int(${index}) + 2
    \    ${title}=    Execute JavaScript    return responseMap.get("${api_products_list}").data.products[${index}].title;
    \    ${sku}=    Execute JavaScript    return responseMap.get("${api_products_list}").data.products[${index}].variants[0].sku;
    \    ${incoming}=    Execute JavaScript    return responseMap.get("${api_products_list}").data.products[${index}].variants[0].incoming.toString();
    \    ${sales}=    Execute JavaScript    return responseMap.get("${api_products_list}").data.products[${index}].variants[0].sales.toString();
    \    ${status}=    Execute JavaScript    return responseMap.get("${api_products_list}").data.products[${index}].status;
    \    ${create_time}=    Execute JavaScript    return responseMap.get("${api_products_list}").data.products[${index}].create_time;
    \    Table Cell Should Contain    tag:table    ${table_row}    3    ${title}
    \    Table Cell Should Contain    tag:table    ${table_row}    5    ${sku}
    \    Table Cell Should Contain    tag:table    ${table_row}    6    ${incoming}
    \    Table Cell Should Contain    tag:table    ${table_row}    7    ${sales}
    \    Table Cell Should Contain    tag:table    ${table_row}    10    ${create_time}
    \    Run Keyword If    ${status}==0    Should Be Not Checked    ${index}
    \    Run Keyword If    ${status}==1    Should Be Checked    ${index}

Up_And_Down_Product
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Wait Until Element Is Visible    dom:document.getElementsByClassName("ant-switch")[0]
    #获取商品总数，包含上下架商品
    ${all_count}    Execute Javascript    return document.getElementsByClassName("ant-switch").length
    #获取上架商品数量
    ${up_product}    Execute Javascript    return document.getElementsByClassName("ant-switch-checked").length
    #上架商品数量应该大于0
    Should Be True    ${up_product}>0
    #上架商品数量应该小于商品总数
    Should Be True    ${up_product}<${all_count}

Validate_Tab
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    ${class_should_be}=    Set Variable    ant-radio-button-wrapper ant-radio-button-wrapper-checked
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-radio-button-wrapper")[0]
    ${class}    Execute Javascript    return document.querySelectorAll(".ant-radio-button-wrapper")[0].getAttribute('class')
    Should Be Equal As Strings    ${class_should_be}    ${class}

Validate_Table_Head
    #验证表头显示
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Sleep    1
    Assign Id To Element    dom:document.querySelectorAll(".editBtn___2yB79")[1]    btn1
    Wait Until Element Is Visible    btn1
    Click Element    btn1
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-body")[0]
    #点击已经选中的，将他们全部取消选中
    ${count}    Execute Javascript    return document.querySelectorAll(".ant-modal-body .ant-checkbox-checked").length
    :FOR    ${index}    IN RANGE    ${count}
    \    Click Element    dom:document.querySelectorAll(".ant-modal-body .ant-checkbox-checked")[0]
    Sleep    1
    #再将所有复选框选中
    ${cancel}    Execute Javascript    return document.querySelectorAll(".ant-modal-body .ant-checkbox").length
    :FOR    ${i}    IN RANGE    ${cancel}
    \    Click Element    dom:document.querySelectorAll(".ant-modal-body .ant-checkbox")[${i}]
    #点击确定按钮
    Click Element    dom:document.querySelectorAll(".ok___1LXqc")[0]
    #添加完所有表头之后再进行表头信息的检验
    Page Should Contain Element    dom:document.querySelectorAll(".ant-table-thead tr th input")[0]
    Page Should Contain    商品图片
    Page Should Contain    商品名称
    Page Should Contain    库存
    Page Should Contain    SKU
    Page Should Contain    浏览量
    Page Should Contain    销量
    Page Should Contain    上架
    Page Should Contain    操作
    Page Should Contain    创建时间
    Page Should Contain Element    dom:document.querySelectorAll(".preview___37DtU")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".delete___2xfx-")[0]
    #图片
    Page Should Contain Element    dom:document.querySelectorAll(".center___1nHSZ")[0]
    #库存
    #在这里修改情况，验证第一个商品是否有库存
    ${should_quantity}    getFirstProductQuantity
    ${show_quantity}    Get Text    dom:document.querySelectorAll(".ant-table-tbody tr")[0].getElementsByTagName("td")[3]
    #如果库存为0
    Run Keyword If    ${should_quantity}==0    compare_quantity    ${show_quantity}
    Run Keyword If    ${should_quantity}>0    compare_quantity2    ${show_quantity}    ${should_quantity}

Validate_Product_Status
    #验证表头显示
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-table-tbody .ant-table-row")[0]
    #获取当前页展示的商品数量
    ${count}    Execute Javascript    return document.querySelectorAll(".ant-table-tbody .ant-table-row").length
    #判断当前页所有商品状态
    :FOR    ${i}    IN RANGE    ${count}
    \    ${status}    getProductStatus    ${i}
    \    Run Keyword If    ${status}==0    should_be_down    ${i}
    \    Run Keyword If    ${status}==1    should_be_up    ${i}

Validate_Product_Sku
    #验证表头显示
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-table-tbody .ant-table-row")[0]
    #获取当前页展示的商品数量
    ${count}    Execute Javascript    return document.querySelectorAll(".ant-table-tbody .ant-table-row").length
    #判断当前页所有商品状态
    :FOR    ${i}    IN RANGE    ${count}
    \    ${should_sku}    getProductSku    ${i}
    \    ${sku}    Get Text    dom:document.querySelectorAll(".ant-table-tbody tr")[${i}].querySelectorAll("td")[4].querySelectorAll("span")[0]
    \    Run Keyword If    ${should_sku}==-1    Should Be True    '${sku}'==''
    \    Run Keyword If    ${should_sku}!=-1    Should Be Equal As Strings    ${should_sku}    ${sku}

Validate_Upload_Alert
    #验证商品上传弹窗
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Wait Until Element Is Visible    class:import___3EkG3
    Click Element    dom:document.querySelectorAll(".import___3EkG3")[0]
    Assign id To Element    dom:document.querySelectorAll(".ant-modal-content")[0]    btn1
    Wait Until Element Is Visible    btn1
    Page Should Contain Element    btn1

Validate_Delete_Product
    #删除商品
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #获取要删除的商品名称
    Wait Until Element Is Visible    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    ${name}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    Assign id To Element    dom:document.querySelectorAll(".delete___2xfx-")[0]    del
    Wait Until Element Is Visible    del
    #点击删除按钮
    Click Element    del
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    Page Should Contain    确定删除吗？
    #确定
    Wait Until Element Is Visible    id:test_delete_modal_sure_btn
    Click Element    id:test_delete_modal_sure_btn
    #等待页面刷新数据
    Sleep    1
    #页面不应该包含该商品名称
    Page Should Not Contain    ${name}

Validate_Cancel_Delete_Product
    #取消删除商品
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #获取要删除的商品名称
    Wait Until Element Is Visible    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    ${name}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    Assign id To Element    dom:document.querySelectorAll(".delete___2xfx-")[0]    del
    Wait Until Element Is Visible    del
    #点击删除按钮
    Click Element    del
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    Page Should Contain    确定删除吗？
    #取消
    Wait Until Element Is Visible    id:test_delete_modal_cancel_btn
    Click Element    id:test_delete_modal_cancel_btn
    #数据无变化
    Page Should Contain    ${name}

*** Keywords ***
compare_quantity
    [Arguments]    ${show_quantity}
    Should Be Equal As Strings    ${show_quantity}    N/A

compare_quantity2
    [Arguments]    ${show_quantity}    ${should_quantity}
    ${show_quantity}    searchStr    ${show_quantity}
    Should Be True    ${show_quantity}==${should_quantity}

Should Be Not Checked
    [Arguments]    ${i}
    #获取按钮类名
    ${class_name}    Execute Javascript    return document.getElementsByClassName("ant-switch")[${i}].getAttribute("class")
    Should Be Equal As Strings    ${class_name}    ant-switch

Should Be Checked
    [Arguments]    ${i}
    #获取按钮类名
    ${class_name}    Execute Javascript    return document.getElementsByClassName("ant-switch")[${i}].getAttribute("class")
    Should Be Equal As Strings    ${class_name}    ant-switch ant-switch-checked

Products Suite Setup
    [Documentation]    商品 case setup
    Login With Default User
    Start Ajax Listener
    #Add Product
    Go To Products Page

Products Suite Teardown
    [Documentation]    删除商品
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case