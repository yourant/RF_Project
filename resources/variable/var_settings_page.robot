*** variable ***

#结账页设置元素class="ant-btn

#.新增元素  locator nav
${locatorB_checkout_button_nav_tradingRules}     dom:document.querySelectorAll('[class="ant-tabs-nav ant-tabs-nav-animated"] [class*="ant-tabs-tab"]')[0]   #交易规则
${locatorB_checkout_button_nav_information}     dom:document.querySelectorAll('[class="ant-tabs-nav ant-tabs-nav-animated"] [class*="ant-tabs-tab"]')[1]   #收货信息
${locatorB_checkout_button_nav_serviceTerms}     dom:document.querySelectorAll('[class="ant-tabs-nav ant-tabs-nav-animated"] [class*="ant-tabs-tab"]')[2]    #服务条款

#.checkout_caef div.ant-tabs-bar div:nth-child(1) > div.ant-tabs-tab-active.ant-tabs-tab

#button
${locatorB_checkout_button_cancel}     dom:document.querySelectorAll('button[type="button"]')[0]  #.取消按钮
${locatorB_checkout_button_save}    dom:document.querySelectorAll('button[type="button"]')[1]   #.保存按钮
# locator invoicinglabel
#${locatorB_checkout_text_customerRights}    dom:document.querySelectorAll('p[class="title_bdd1"]')[0]              #顾客权限文字
#${locatorB_checkout_label_notMembers}    dom:document.querySelectorAll('[class*="radio_btn_cddf"]')[0]    #.顾客权限-不开启会员注册
${locatorB_checkout_label_registerMembers}    dom:document.querySelectorAll('[class*="radio_btn_cddf"]')[0]    #.顾客权限-注册会员与非会员可以购买
${locatorB_checkout_label_buyMembers}    dom:document.querySelectorAll('[class*="radio_btn_cddf"]')[1]    #.顾客权限-会员购买

#顾客联系方式
${locatorB_checkout_label_customerEmail}    dom:document.querySelectorAll('.radio_btn_cddf')[3]    #.顾客联系方式-邮箱
${locatorB_checkout_label_customerPhone}    dom:document.querySelectorAll('.radio_btn_cddf')[4]    #.顾客联系方式-手机
${locatorB_checkout_label_customerEmailAndPhone}    dom:document.querySelectorAll('.radio_btn_cddf')[5]    #.顾客联系方式-邮箱和手机

# locator invoicingraido
#收货信息
${locatorB_checkout_radio_item}    dom:document.querySelectorAll('[class*="radio_item"]')     # list  item
#..姓名格式
${locatorB_checkout_radio_name}    dom:document.querySelectorAll('[class*="radio_desc"]')[0]    #.姓名
${locatorB_checkout_radio_surnameAndName}    dom:document.querySelectorAll('[class*="radio_desc"]')[1]    #.姓和名分开写
#..公司名
${locatorB_checkout_radio_companyNameMandatory}    dom:document.querySelectorAll('[class*="radio_desc"]')[2]    #.必填
${locatorB_checkout_radio_companyNameOptional}    dom:document.querySelectorAll('[class*="radio_desc"]')[3]     #.选填
${locatorB_checkout_radio_companyNameHidden}    dom:document.querySelectorAll('[class*="radio_desc"]')[4]     #.隐藏
#..邮箱地址
${locatorB_checkout_radio_emailCodeMandatory}    dom:document.querySelectorAll('[class*="radio_desc"]')[5]     #.必填
${locatorB_checkout_radio_emailCodeOptional}    dom:document.querySelectorAll('[class*="radio_desc"]')[6]     #.选填
${locatorB_checkout_radio_emailCodeHidden}    dom:document.querySelectorAll('[class*="radio_desc"]')[7]     #.隐藏
#..手机号码
${locatorB_checkout_radio_phoneCodeMandatory}    dom:document.querySelectorAll('[class*="radio_desc"]')[8]     #.必填
${locatorB_checkout_radio_phoneCodeOptional}    dom:document.querySelectorAll('[class*="radio_desc"]')[9]     #.选填
${locatorB_checkout_radio_phoneCodeHidden}    dom:document.querySelectorAll('[class*="radio_desc"]')[10]     #.隐藏

## locator invoicingService
#服务说明
#..退款条约
${locatorB_checkout_button_generateRefundTreaty}    dom:document.querySelectorAll('a[class="input-system-tpl"]')[0]       #.退款条约-生成系统默认模版
${locatorB_checkout_textarea_refundTreatyInputBox}    dom:document.querySelectorAll('textarea[class="ant-input"]')[0]       #.退款条约-文本输入框
#..隐私政策
${locatorBcheckout_button_generatePolicy}    dom:document.querySelectorAll('a[class="input-system-tpl"]')[1]       #.隐私政策-生成系统默认模版
${locatorB_checkout_textarea_policyInputBox}    dom:document.querySelectorAll('textarea[class="ant-input"]')[1]      #.隐私政策-文本输入框
#..服务条约
${locatorB_checkout_button_generateServiceTreaty}    dom:document.querySelectorAll('a[class="input-system-tpl"]')[2]       #.服务条约-生成系统默认模版
${locatorB_checkout_textarea_refundServiceInputBox}    dom:document.querySelectorAll('textarea[class="ant-input"]')[2]      #.服务条约-文本输入框



