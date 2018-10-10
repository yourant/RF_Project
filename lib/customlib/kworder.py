# -*- coding:utf-8 -*-

from kwcheckout import *
from kwpayment import *

reload(sys)
sys.setdefaultencoding('utf-8')


def admin_orders_by_raw_data_py(query_str, cookie=init_cookie):
    url = home_page_url + '/api/admin/orders'
    try:
        response_data = requests.get(url=url, headers={"cookie": cookie['cookie']}, params=query_str)
        return_data = {}
        return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def admin_orders_by_str_py(string, cookie=init_cookie):
    url = '%s/api/admin/orders/%s' % (home_page_url, string)
    try:
        response_data = requests.get(url=url, headers={"cookie": cookie['cookie']})
        return_data = {}
        return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def orders_fulfillments_via_post_py(order_token, data, cookie=init_cookie):
    '''
    设置订单发货
    :param order_token:
    :param cookie:
    :return:
    '''
    url = '%s/api/admin/orders/%s/fulfillments' % (home_page_url, order_token)
    try:
        response_data = requests.post(url=url, headers={"cookie": cookie['cookie']}, json=data)
        return_data = {}
        return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def orders_fulfillments_via_get_py(order_token, cookie=init_cookie):
    '''
    查询订单发货状态
    :param order_token:
    :param cookie:
    :return:
    '''
    url = '%s/api/admin/orders/%s/fulfillments' % (home_page_url, order_token)
    try:
        response_data = requests.get(url=url, headers={"cookie": cookie['cookie']})
        return_data = {}
        return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def orders_finish_py(order_token, fulfillment_id, cookie=init_cookie):
    '''
     B端确认收货
    fulfillment的id通过orders_fulfillments_via_post_py获取
    :param order_token:
    :param fulfillment_id:
    :param cookie:
    :return:
    '''
    url = '%s/api/admin/orders/%s/fulfillments/%s/finish' % (home_page_url, order_token, fulfillment_id)
    try:
        response_data = requests.patch(url=url, headers={"cookie": cookie['cookie']})
        return_data = {}
        return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def orders_cancel_py(order_token, cookie=init_cookie):
    '''
     B端取消订单
    :param order_token:
    :param cookie:
    :return:
    '''
    url = '%s/api/admin/orders/%s/cancel' % (home_page_url, order_token)
    try:
        response_data = requests.patch(url=url, headers={"cookie": cookie['cookie']})
        return_data = {}
        return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def del_order_py(order_token, cookie=init_cookie):
    '''
    删除订单（只能软删除已取消订单）
    :param order_token:
    :param cookie:
    :return:
    '''
    url = '%s/api/admin/orders/%s.json' % (home_page_url, order_token)
    try:
        response_data = requests.delete(url=url, headers={"cookie": cookie['cookie']})
        return_data = {}
        return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def shipment_with_conf_py(order_token, conf={}, cookie=init_cookie):
    '''
    通过productidlist创建未完成订单
    :param order_token:
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(orders_fulfillments_data)
    dict_deepupdate(data, conf)
    return orders_fulfillments_via_post_py(order_token, data, cookie)


def query_all_dealing_order_py(cookie=init_cookie):
    '''
    查询待处理订单全部列表的信息
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(query_orders_data)
    del data['page']
    del data['per_page']
    data['deal_status'] = 'dealing'
    return admin_orders_by_raw_data_py(data, cookie)


def query_dealing_order_by_num_py(num=10, cookie=init_cookie):
    '''
    查询待处理订单列表的信息(默认10条)
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(query_orders_data)
    data['per_page'] = num
    data['deal_status'] = 'dealing'
    return admin_orders_by_raw_data_py(data, cookie)


def get_dealing_order_count_py(cookie=init_cookie):
    '''
    获取待处理订单总个数
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(query_orders_data)
    data['deal_status'] = 'dealing'
    return admin_orders_by_raw_data_py(data, cookie)['content']['count']


def query_all_undeal_order_py(cookie=init_cookie):
    '''
    查询未完成订单全部列表的信息
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(query_orders_data)
    del data['page']
    del data['per_page']
    data['deal_status'] = 'undeal'
    return admin_orders_by_raw_data_py(data, cookie)


def query_undeal_order_by_num_py(num=10, cookie=init_cookie):
    '''
    查询未完成订单列表的信息(默认10条)
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(query_orders_data)
    data['per_page'] = num
    data['deal_status'] = 'undeal'
    return admin_orders_by_raw_data_py(data, cookie)


def get_undeal_order_count_py(cookie=init_cookie):
    '''
    获取未完成订单总个数
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(query_orders_data)
    data['deal_status'] = 'undeal'
    return admin_orders_by_raw_data_py(data, cookie)['content']['count']


def query_order_py(order_token, cookie=init_cookie):
    '''
    查询指定order的信息
    :param order_token:
    :param cookie:
    :return:
    '''
    return admin_orders_by_str_py(order_token, cookie)


def get_order_num_by_order_token_py(order_token, cookie=init_cookie):
    '''
    获取指定order订单编号
    :param order_token:
    :param cookie:
    :return:
    '''
    return admin_orders_by_str_py(order_token, cookie)['content']['order']['order_no']


def get_latest_dealing_order_num_by_num_py(num, cookie=init_cookie):
    '''
    通过指定个数，获取最新待处理订单的订单编号
    :param cookie:
    :return:    订单编号list
    '''
    data_dealing_orders = query_dealing_order_by_num_py(num, cookie)['content']['orders']
    list_order_num = []
    for data_dealing_order in data_dealing_orders:
        list_order_num.append(data_dealing_order['number'])
    return list_order_num


def get_latest_dealing_order_num_py(cookie=init_cookie):
    '''
    获取最新一个待处理订单的订单编号
    :param cookie:
    :return:    订单编号
    '''
    return get_latest_dealing_order_num_by_num_py(1, cookie)[0]


def get_latest_undeal_order_num_by_num_py(num, cookie=init_cookie):
    '''
    通过指定个数，获取最新未完成订单的订单编号
    :param cookie:
    :return:    订单编号list
    '''
    data_undeal_orders = query_undeal_order_by_num_py(num, cookie)['content']['orders']
    list_order_num = []
    for data_undeal_order in data_undeal_orders:
        list_order_num.append(data_undeal_order['number'])
    return list_order_num


def get_latest_undeal_order_num_py(cookie=init_cookie):
    '''
    获取最新一个未完成订单的订单编号
    :param cookie:
    :return:    订单编号
    '''
    return get_latest_undeal_order_num_by_num_py(1, cookie)[0]


def add_order_by_order_token_py(order_token, cookie=init_cookie):
    '''
    通过order_token添加新订单
    	支付方式	支付状态	物流状态	订单状态
        COD支付	待支付	待发货	进行中
    :param order_token:
    :param cookie:
    :return:
    '''
    return add_deading_order_with_conf_py({'order_token': order_token}, cookie)


def add_deading_order_with_delivering_status_py(conf={}, cookie=init_cookie):
    '''
    创建待处理订单的发货状态为：待发货
    	COD支付	待支付	待发货	进行中
    :param conf:
    :param cookie:
    :return:
    '''
    return add_deading_order_with_conf_py(conf, cookie)


def add_deading_order_with_some_delivered_status_py(conf={}, cookie=init_cookie):
    '''
    创建待处理订单的发货状态为：部分发货
    	COD支付	待支付	部分发货	进行中
    :param conf:
    :param cookie:
    :return:
    '''
    order_token = add_deading_order_with_conf_py(conf, cookie)
    productidlist_in_order = get_productidlist_in_order_py(order_token, cookie)
    conf = {'line_item_ids': [productidlist_in_order[0]]}
    return shipment_with_conf_py(order_token, conf, cookie)


def add_deading_order_with_all_delivered_status_py(conf={}, cookie=init_cookie):
    '''
    创建待处理订单的发货状态为：全部发货
    	COD支付	待支付	全部发货	进行中
    :param conf:
    :param cookie:
    :return:
    '''
    order_token = add_deading_order_with_conf_py(conf, cookie)
    productidlist_in_order = get_productidlist_in_order_py(order_token, cookie)
    conf = {'line_item_ids': productidlist_in_order}
    return shipment_with_conf_py(order_token, conf, cookie)


def add_deading_order_with_some_finished_status_py(conf={}, cookie=init_cookie):
    '''
    创建待处理订单的
    发货状态：部分完成
    	COD支付	已支付	部分完成	进行中
    :param conf:
    :param cookie:
    :return:
    '''
    order_token = add_deading_order_with_conf_py(conf, cookie)
    productidlist_in_order = get_productidlist_in_order_py(order_token, cookie)
    conf00 = {'line_item_ids': [productidlist_in_order[0]]}
    conf01 = {'line_item_ids': [productidlist_in_order[1]]}
    fulfillment_id00 = shipment_with_conf_py(order_token, conf00, cookie)['content']['fulfillment']['id']
    fulfillment_id01 = shipment_with_conf_py(order_token, conf01, cookie)['content']['fulfillment']['id']
    return orders_finish_py(order_token, fulfillment_id01, cookie)


def add_deading_order_with_finished_status_py(conf={}, cookie=init_cookie):
    '''
    创建未完成订单的
    发货状态：全部完成
    订单状态：已完成
    	COD支付	已支付	全部完成	已完成
    :param conf:
    :param cookie:
    :return:
    '''
    order_token = add_deading_order_with_conf_py(conf, cookie)
    productidlist_in_order = get_productidlist_in_order_py(order_token, cookie)
    conf = {'line_item_ids': productidlist_in_order}
    fulfillment_id = shipment_with_conf_py(order_token, conf, cookie)['content']['fulfillment']['id']
    return orders_finish_py(order_token, fulfillment_id, cookie)


def add_undead_order_with_to_pay_status_py(cookie=init_cookie):
    '''
    创建待处理订单的支付状态为：待支付
    	无	待支付	未完成
    :param conf:
    :param cookie:
    :return:
    '''
    return add_undeal_order_with_products_py(cookie)


def add_undead_order_with_order_cancel_status_py(cookie=init_cookie):
    '''
    创建待处理订单的订单状态为：已取消
    	无	待支付	已取消
    :param conf:
    :param cookie:
    :return:
    '''
    order_token = add_undeal_order_with_products_py(cookie)
    orders_cancel_py(order_token, cookie)
    return order_token


def get_productidlist_in_order_py(order_token, cookie=init_cookie):
    '''
    通过order_token获取对应order中的productid
    :param order_token:
    :param cookie:
    :return: list
    '''
    productidlist_in_order = []
    for item in query_order_py(order_token, cookie)['content']['order']['line_items']:
        productidlist_in_order.append(item['id'])
    return productidlist_in_order


def add_deading_order_with_conf_py(conf={}, cookie=init_cookie):
    '''
    通过conf添加新订单
    	支付方式	支付状态	物流状态	订单状态
        COD支付	待支付	待发货	进行中
    1、调计算价格接口 2、调shipping_lines接口 3、调订单地址接口 4、调付款接口
    :param conf:
    :param cookie:
    :return:
    '''
    key_list = conf.keys()

    if 'order_token' in key_list:
        # 接受已生成的订单
        order_token = conf['order_token']
    else:
        if 'productidlist' in key_list:
            # 指定产品生成订单
            order_token = get_order_token_by_productidlist_py(conf['productidlist'], cookie)
        else:
            # 生成默认订单（含两个max产品）
            order_token = add_undeal_order_with_products_py(cookie)

    # 1、调计算价格接口
    if 'price_calculate_conf' in key_list:
        price_calculate_conf = conf['price_calculate_conf']
    else:
        price_calculate_conf = copy.deepcopy(price_calculate_data)
    price_calculate_conf['order_token'] = order_token
    calculate_result = do_price_calculate_with_conf_py(price_calculate_conf, cookie)

    # 2、调shipping_lines接口
    if 'shipping_lines_conf' in key_list:
        shipping_lines_conf = conf['shipping_lines_conf']
    else:
        shipping_lines_conf = copy.deepcopy(shipping_lines_data)
    shipping_lines_conf['order_token'] = order_token
    shipping_lines_result = get_shipping_lines_with_conf_py(shipping_lines_conf, cookie)

    # 3、调订单地址接口
    if 'place_order_conf' in key_list:
        place_order_conf = conf['place_order_conf']
    else:
        place_order_conf = copy.deepcopy(place_order_data)
    place_order_conf['order_token'] = order_token
    place_order_conf['prices'] = calculate_result['content']['data']['prices']
    place_order_conf['shipping_line'] = shipping_lines_result['content']['data']['shipping_lines'][0]
    add_place_order_with_conf_py(place_order_conf, cookie)

    # 4、调付款接口
    if 'payment_pay_conf' in key_list:
        payment_pay_conf = conf['payment_pay_conf']
        # 保证payment_line的数据是有效的
        if not conf['payment_pay_conf'].has_key('payment_line'):
            data_payment_line = payment_list_py()['content']['data'][0]['channel_list'][0]
            payment_pay_conf['payment_line'] = data_payment_line
    else:
        payment_pay_conf = copy.deepcopy(payment_pay_data)
        data_payment_line = payment_list_py()['content']['data'][0]['channel_list'][0]
        payment_pay_conf['payment_line'] = data_payment_line
    payment_pay_conf['order_token'] = order_token
    do_pay_with_conf_py(payment_pay_conf, cookie)

    return order_token


def add_dealing_order_with_products_py(cookie=init_cookie):
    '''
    添加待处理订单(包含两个产品)
        支付方式	支付状态	物流状态	订单状态
        COD支付	待支付	待发货	进行中
    :param cookie:
    :return:
    '''
    order_token = add_undeal_order_with_products_py(cookie)
    add_order_by_order_token_py(order_token, cookie)
    return order_token


def add_dealing_order_with_product_py(cookie=init_cookie):
    '''
    添加待处理订单(只包含一个产品)
    	支付方式	支付状态	物流状态	订单状态
        COD支付	待支付	待发货	进行中
    :param cookie:
    :return:
    '''
    order_token = add_undeal_order_with_product_py(cookie)
    add_order_by_order_token_py(order_token, cookie)
    return order_token


def add_dealing_order_by_productidlist_py(productidlist, cookie=init_cookie):
    '''
    通过productidlist创建待处理订单
    :param productidlist:
    :param cookie:
    :return:
    '''
    return add_deading_order_with_conf_py({'productidlist': productidlist}, cookie)


def add_undeal_order_with_products_py(cookie=init_cookie):
    '''
    添加未完成订单(包含两个产品)
    	支付方式	支付状态	订单状态
    	无	    待支付	未完成
    :param cookie:
    :return:
    '''
    count = product_search_py(cookie)['content']['data']['total']
    if count == 0:
        add_max_product_py(cookie)
        add_max_product_py(cookie)
    elif count == 1:
        add_max_product_py(cookie)
    search_data = product_search_py(cookie)
    productid01 = search_data['content']['data']['products'][0]['id']
    productid02 = search_data['content']['data']['products'][1]['id']
    productidlist = [productid01, productid02]
    return get_order_token_by_productidlist_py(productidlist, cookie)


def add_undeal_order_with_product_py(cookie=init_cookie):
    '''
    添加未完成订单(只包含一个产品)
        支付方式	支付状态	订单状态
    	无	    待支付	未完成
    :param cookie:
    :return:
    '''
    count = product_search_py(cookie)['content']['data']['total']
    if count == 0:
        add_max_product_py(cookie)
    productid01 = product_search_py(cookie)['content']['data']['products'][0]['id']
    return get_order_token_by_productid_py(productid01, cookie)


def add_undeal_order_by_productidlist_py(productidlist, cookie=init_cookie):
    '''
    通过productidlist创建未完成订单
    :param productidlist:
    :param cookie:
    :return:
    '''
    return get_order_token_by_productidlist_py(productidlist, cookie)


if __name__ == '__main__':
    # print get_order_token_by_productid_py('602')
    # print get_order_token_by_productidlist_py(['602', '601'])
    # print json.dumps(query_undeal_order_by_num_py())
    # print add_undeal_order_with_products_py()
    # shipping_address = {"first_name": "auto", "last_name": "test"}
    # place_order_conf = {'shipping_address': shipping_address}
    # conf = {'place_order_conf': place_order_conf}
    # print add_deading_order_with_conf_py(conf)

    # print shipment_with_conf_py('90e29c86-4780-4fb1-bfb1-36249deb69bc')
    # print orders_finish_py('90e29c86-4780-4fb1-bfb1-36249deb69bc', '85382d5a-6d8a-4d46-8c50-9407802173ba')
    # print add_deading_order_with_some_delivered_status_py()
    print add_deading_order_with_some_finished_status_py()
    # print get_latest_undeal_order_num_py()
    # productid = add_launched_product_py()\
    # print add_order_by_productid_py(productid)
    # print query_dealing_order()
    # print query_undeal_order()
    # print del_order('2e043a92-46c5-4f26-953a-88f347cd1e08')