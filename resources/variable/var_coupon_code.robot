*** Settings ***
Resource          var_common.robot

*** Variables ***
#.locatorB_couponCodeNew

${locatorB_couponCodeNew_input_activityName}    dom:document.querySelectorAll('[id="title"]')[0]   # 活动名称input
${locatorB_couponCodeNew_button_addActivity}    dom:document.querySelectorAll('[class*="large_btn"]')[0]     #.新建活动
${locatorB_couponCodeNew_icon_backcouponlist}    dom:document.querySelectorAll('[class*="djfont dj-back"]')[0]    # 返回优惠码列表
${locatorB_couponCodeNew_button_allProducts}    dom:document.querySelectorAll('[class*="ant-btn li"]')[0]  # 选择全部商品
${locatorB_couponCodeNew_button_chooseSomeProducts}    dom:document.querySelectorAll('[class*="btnselproduct"]')[0]    # 选择部分商品

${locatorB_couponCodeNew_span_chooseProduct}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td[class="ant-table-selection-column"]')    # 选择部分商品-第一个商品

${locatorB_couponCodeNew_icon_continueToAdd}    dom:document.querySelectorAll('[class="anticon anticon-plus"]')[0]    # 添加

${locatorB_couponCodeNew_span_button_chooseProductSure}    dom:document.querySelectorAll('button[class*="ant-btn middle_btn"]')     # 选择部分商品-确定按钮
${locatorB_couponCodeNew_text_hadAdded}    dom:document.querySelectorAll('p[class*="product"]')[0]    #
${locatorB_couponCodeNew_input_couponCode}    id:code    #
${locatorB_couponCodeNew_select_couponStyle}    dom:document.querySelectorAll('[class="ant-select-selection__rendered"]')[0]    #折扣类型，折扣券
${locatorB_couponCodeNew_selectItem_discountCoupon}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[0]    #折扣类型，折扣券
${locatorB_couponCodeNew_selectItem_cashCoupon}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[1]    #折扣类型，代金券
${locatorB_couponCodeNew_selectTime_start}    dom:document.querySelectorAll('[class*="ant-calendar-picker-input ant-input"]')[0]      #.优惠券 活动开始时间选择
${locatorB_couponCodeNew_selectTime_end}    dom:document.querySelectorAll('[class*="ant-calendar-picker-input ant-input"]')[1]     #.优惠券 活动结束时间选择
${locatorB_couponCodeNew_selectTime_startInput}    dom:document.querySelectorAll('[class*="ant-calendar-input"]')[1]      #.优惠券 活动开始时间输入
${locatorB_couponCodeNew_selectTime_endInput}    dom:document.querySelectorAll('[class*="ant-calendar-input"]')[1]      #.优惠券 活动结束时间输入
${locatorB_couponCodeNew_selectTime_confirm}    dom:document.querySelectorAll('[class*="ant-calendar-ok-btn"]')[0]     #.优惠券 选择时间确认按钮
${locatorB_couponCodeNew_selectTime_notEndTime}    dom:document.querySelectorAll('[class="ant-checkbox-wrapper"] span[class*="ant-checkbox"]')[0]    #.不限制结束时间 id="state.date_end_unlimited"
${locatorB_couponCodeNew_selectTime_notEndTimeStart}    dom:document.querySelectorAll('[class="ant-form-item-children"] [class*="ant-checkbox"]')[1]     #判断按钮是否选中状态  ant-checkbox ant-checkbox-checked
${locatorB_couponCodeNew_text_input_promoCode}    dom:document.querySelectorAll('[id="code"]')[0]    #.优惠码输入框
${locatorB_couponCodeNew_text_p_promoCrandom}    dom:document.querySelectorAll('p[class*="random"]')[0]    #随机生成
${locatorB_couponCodeNew_text_input_num}    dom:document.querySelectorAll('[id="usage_limit"]')[0]       #.优惠券 数量  state.total_num
${locatorB_couponCodeNew_text_input_Mannum}    dom:document.querySelectorAll('[id="once_per_customer"]')[0]    #每人限用
${locatorB_couponCodeNew_input_noLimit}        dom:document.querySelectorAll('span[class*="ant-checkbox"]')[2]  #.优惠券 数量 不限按钮
${locatorB_couponCodeNew_input_limited}    dom:document.querySelectorAll('span[class*="ant-checkbox"]')[4]       #.优惠券 每人限用 不限按钮
${locatorB_couponCodeNew_span_limitJudge}    dom:document.querySelectorAll('[class="ant-checkbox-wrapper"] span[class="ant-checkbox"]')[2]    #.优惠券 每人限用 不限按钮(判断复选框)
${locatorB_couponCodeNew_text_input_discountpreferential}    dom:document.querySelectorAll('[id*="prerequisite_quantity_range"]')[0]      #.优惠门槛 满多少 - 折扣劵
${locatorB_couponCodeNew_text_input_cashpreferential}    dom:document.querySelectorAll('[id*="prerequisite_subtotal_range"]')[0]    #.优惠门槛 满多少 - 代金劵
${locatorB_couponCodeNew_text_input_notThreshold}    dom:document.querySelectorAll('span[class*="ant-checkbox"]')[6]     #.优惠门槛 单选 无门槛
${locatorB_couponCodeNew_text_input_discount}    dom:document.querySelectorAll('[id="prerequisite_quantity_range[0].value"]')[0]      #.折扣比例 输入 - 折扣劵
${locatorB_couponCodeNew_text_input_cash}    dom:document.querySelectorAll('[id="prerequisite_subtotal_range[0].value"]')[0]    #.折扣比例 输入 - 代金劵

${locatorB_couponCodeNew_text_button_defaultMore}    dom:document.querySelectorAll('[class*="ant-btn default"]')[1]    # 部分商品 - 选择商品 - 加载更多 按钮
${locatorB_couponCodeNew_text_icon_anticonDown}    dom:document.querySelectorAll('[class*="anticon anticon-down"]')[0]    # 部分商品 - 选择商品 - 第一个商品 - 关闭 箭头
${locatorB_couponCodeNew_text_icon_anticonUp}    dom:document.querySelectorAll('[class*="anticon anticon-up"]')[0]    # 部分商品 - 选择商品 - 第一个商品 - 展开 箭头

${locatorB_couponCodeNew_button_nextStep}    dom:document.querySelectorAll('[class*="next_step"] [class*="ant-btn middle_btn"]')[0]    # 下一步 按钮
${locatorB_couponCodeNew_button_prevStep}    dom:document.querySelectorAll('[class*="prev_step"]')[0]    # 上一步 按钮

${locatorB_couponCodeNew_items_listProduct}    ${locatorB_table_listItems}    # 商品列表

#.locatorB_couponCode
${locatorB_couponCode_items_listCoupon}    ${locatorB_table_listItems}    # 列表中的优惠码集合
${locatorB_couponCode_button_all}    dom:document.querySelectorAll('div[class*="ant-tabs-tab"]')[0]     #全部
${locatorB_couponCode_button_before}    dom:document.querySelectorAll('div[class*="ant-tabs-tab"]')[1]   # 未开始
${locatorB_couponCode_button_doing}    dom:document.querySelectorAll('div[class*="ant-tabs-tab"]')[2]    # 进行中
${locatorB_couponCode_button_finish}    dom:document.querySelectorAll('div[class*="ant-tabs-tab"]')[3]    # 已结束

#.input
${locatorB_couponCode_input_enterCouponCode}    dom:document.querySelectorAll('[id="keywords"]')[0]     #.搜索框输入优惠码、编号
${locatorB_couponCode_button_searchCouponCode}    dom:document.querySelectorAll('[data-robot="btn_search"]')[0]    #.搜索按钮
${locatorB_couponCode_button_resetCouponCode}    dom:document.querySelectorAll('[data-robot="btn_reset"]')[0]    #.重置按钮

${locatorB_couponCode_menu_selectStyle}    dom:document.querySelectorAll('[id="discount_type"]')[0]
${locatorB_couponCode_menu_allStyle}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[0]    #所有类型
${locatorB_couponCode_menu_cashStyle}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[1]    #代金劵
${locatorB_couponCode_menu_discountStyle}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[2]    #折扣劵


#${locatorB_couponCode_text_firstCoupon_activityNum}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(1)')[0]    #第一个优惠码 - 活动编号
${locatorB_couponCode_text_firstCoupon_activityName}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(1)')    #第一个优惠码 - 活动名称
${locatorB_couponCode_text_firstCoupon_couponCode}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(2)')   #第一个优惠码 - 优惠码
${locatorB_couponCode_text_firstCoupon_activityTime}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(3)')[0]    #第一个优惠码 - 活动时间
${locatorB_couponCode_text_firstCoupon_activityRules}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(4)')[0]    #第一个优惠码 - 优惠规则
${locatorB_couponCode_text_firstCoupon_activityRange}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(5)')[0]    #第一个优惠码 - 活动范围
${locatorB_couponCode_text_firstCoupon_beenUsedAndUnUsed}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(6)')[0]    #第一个优惠码 - 已使用/剩余库存
#${locatorB_couponCode_text_firstCoupon_createTime}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(8)')[0]    #第一个优惠码 - 创建时间
${locatorB_couponCode_tag_firstCoupon_activityStatus}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(7)')    #第一个优惠码 - 活动状态
${locatorB_couponCode_icon_firstCoupon_activityPreview}    dom:document.querySelectorAll('[class*="djfont dj-preview"]')    #第一个优惠码 - 预览图标
${locatorB_couponCode_icon_firstCoupon_activityDelete}    dom:document.querySelectorAll('[class*="djfont delete"]')    #第一个优惠码 - 删除图标
${locatorB_couponCode_icon_firstCoupon_activityStop}    dom:document.querySelectorAll('[class*="djfont stop"]')[0]    #第一个优惠码 - 提前结束图标