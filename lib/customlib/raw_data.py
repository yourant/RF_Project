# -*- coding:utf-8 -*-
import sys

reload(sys)
sys.setdefaultencoding('utf-8')

# 含子商品的商品数据（max）
product_max_data_with_sub = {
    "id": "",
    "title": "autotest_title",
    "brief": "autotest_subtitle",
    "description": "autotest_description",
    "published": True,
    "published_at": "",
    "need_variant_image": True,
    "requires_shipping": True,
    "taxable": True,
    "collection_ids": [

    ],
    "vendor": "autotest_supplier",
    "vendor_url": "https://autotest.com",
    "seo_title": "autotest_title",
    "seo_keywords": [
        "autotest_seo"
    ],
    "seo_url": "",
    "handle": "autotest_title",
    "seo_description": "autotest_description",
    "tags": [
        "auto_tag"
    ],
    "has_only_default_variant": False,
    "inventory_tracking": True,
    "inventory_policy": "continue",
    "images": [
        {
            "id": "",
            "image": {
                "path": "9b83ab55dd5078df84f05a51f912b063.jpeg",
                "alt": "",
                "aspect_ratio": "1.3333333333333333",
                "height": "504",
                "src": "//cdn.shoplazza.com/9b83ab55dd5078df84f05a51f912b063.jpeg",
                "width": "672",
                "size": "53455"
            }
        }
    ],
    "options": [
        {
            "name": "color",
            "values": [
                "red",
                "black"
            ]
        },
        {
            "name": "size",
            "values": [
                "min",
                "max"
            ]
        }
    ],
    "variants": [
        {
            "image": {
                "path": "9b83ab55dd5078df84f05a51f912b063.jpeg",
                "alt": "",
                "aspect_ratio": "1.3333333333333333",
                "height": "504",
                "src": "//cdn.shoplazza.com/9b83ab55dd5078df84f05a51f912b063.jpeg",
                "width": "672",
                "size": "53455"
            },
            "id": "",
            "price": "10",
            "compare_at_price": "20",
            "weight": "11",
            "weight_unit": "kg",
            "inventory_quantity": "999",
            "sku": "",
            "barcode": "",
            "option1": "red",
            "option2": "min",
            "option3": "",
            "_key": '{"color":"red","size":"min"}'
        },
        {
            "image": {
                "path": "9b83ab55dd5078df84f05a51f912b063.jpeg",
                "alt": "",
                "aspect_ratio": "1.3333333333333333",
                "height": "504",
                "src": "//cdn.shoplazza.com/9b83ab55dd5078df84f05a51f912b063.jpeg",
                "width": "672",
                "size": "53455"
            },
            "id": "",
            "price": "10",
            "compare_at_price": "20",
            "weight": "11",
            "weight_unit": "kg",
            "inventory_quantity": "999",
            "sku": "",
            "barcode": "",
            "option1": "red",
            "option2": "max",
            "option3": "",
            "_key": '{"color":"red","size":"max"}'
        },
        {
            "image": {
                "path": "9b83ab55dd5078df84f05a51f912b063.jpeg",
                "alt": "",
                "aspect_ratio": "1.3333333333333333",
                "height": "504",
                "src": "//cdn.shoplazza.com/9b83ab55dd5078df84f05a51f912b063.jpeg",
                "width": "672",
                "size": "53455"
            },
            "id": "",
            "price": "10",
            "compare_at_price": "20",
            "weight": "11",
            "weight_unit": "kg",
            "inventory_quantity": "999",
            "sku": "",
            "barcode": "",
            "option1": "black",
            "option2": "min",
            "option3": "",
            "_key": '{"color":"black","size":"min"}'
        },
        {
            "image": {
                "path": "9b83ab55dd5078df84f05a51f912b063.jpeg",
                "alt": "",
                "aspect_ratio": "1.3333333333333333",
                "height": "504",
                "src": "//cdn.shoplazza.com/9b83ab55dd5078df84f05a51f912b063.jpeg",
                "width": "672",
                "size": "53455"
            },
            "id": "",
            "price": "10",
            "compare_at_price": "20",
            "weight": "11",
            "weight_unit": "kg",
            "inventory_quantity": "999",
            "sku": "",
            "barcode": "",
            "option1": "black",
            "option2": "max",
            "option3": "",
            "_key": '{"color":"black","size":"max"}'
        }
    ]
}

# 商品数据（max）
product_max_data = {
    "id": "",
    "title": "autotest_title",
    "brief": "autotest_subtitle",
    "description": "autotest_description",
    "published": True,
    "published_at": "",
    "need_variant_image": False,
    "requires_shipping": True,
    "taxable": True,
    "collection_ids": [

    ],
    "vendor": "autotest_supplier",
    "vendor_url": "https://autotest.com",
    "seo_title": "autotest_title",
    "seo_keywords": [
        "autotest_seo"
    ],
    "seo_url": "",
    "handle": "autotest_title",
    "seo_description": "autotest_description",
    "tags": [
        "auto_tag"
    ],
    "has_only_default_variant": True,
    "inventory_tracking": True,
    "inventory_policy": "continue",
    "images": [
        {
            "id": "",
            "image": {
                "path": "9b83ab55dd5078df84f05a51f912b063.jpeg",
                "alt": "",
                "aspect_ratio": "1.3333333333333333",
                "height": "504",
                "src": "//cdn.shoplazza.com/9b83ab55dd5078df84f05a51f912b063.jpeg",
                "width": "672",
                "size": "53455"
            }
        }
    ],
    "options": [

    ],
    "variants": [
        {
            "compare_at_price": "888",
            "barcode": "123456",
            "sku": "autotestsku",
            "inventory_quantity": "77",
            "weight": "123",
            "price": "444",
            "id": "",
            "image": None,
            "weight_unit": "kg",
            "option1": "",
            "option2": "",
            "option3": "",
            "_key": "{}"
        }
    ]
}

# 商品数据（min）
product_min_data = {
    "id": "",
    "title": "autotest_title",
    "brief": "",
    "description": "",
    "published": False,
    "published_at": "",
    "need_variant_image": False,
    "requires_shipping": False,
    "taxable": False,
    "collection_ids": [

    ],
    "vendor": "",
    "vendor_url": "",
    "seo_title": "autotest_title",
    "seo_keywords": [

    ],
    "seo_url": "",
    "handle": "autotest_title",
    "seo_description": "",
    "tags": [

    ],
    "has_only_default_variant": True,
    "inventory_tracking": False,
    "inventory_policy": "continue",
    "images": [
        {
            "id": "",
            "image": {
                "path": "9b83ab55dd5078df84f05a51f912b063.jpeg",
                "alt": "",
                "aspect_ratio": "1.3333333333333333",
                "height": "504",
                "src": "//cdn.shoplazza.com/9b83ab55dd5078df84f05a51f912b063.jpeg",
                "width": "672",
                "size": "53455"
            }
        }
    ],
    "options": [

    ],
    "variants": [
        {
            "compare_at_price": "888",
            "price": "444",
            "id": "",
            "image": None,
            "weight": "",
            "weight_unit": "kg",
            "inventory_quantity": "",
            "sku": "",
            "barcode": "",
            "option1": "",
            "option2": "",
            "option3": "",
            "_key": "{}"
        }
    ]
}

collecion_data = {
    "id": "",
    "title": "autotest_collection_name",
    "description": "autotest_collection_description",
    "image": {
        "path": "9b83ab55dd5078df84f05a51f912b063.jpeg",
        "alt": "",
        "aspect_ratio": "1.3333333333333333",
        "height": "504",
        "src": "//cdn.shoplazza.com/9b83ab55dd5078df84f05a51f912b063.jpeg",
        "width": "672",
        "size": "53455"
    },
    "seo_title": "autotest_collection_name",
    "seo_url": "",
    "handle": "autotest_collection_name",
    "seo_description": "autotest_collection_description",
    "seo_keywords": [
        "autotest_collection_seo"
    ],
    "products": [

    ],
    "_": 1542884025491,
    "product_ids": [

    ]
}

comment_data = {
    'star': '5',
    'content': 'autotest_comment_content',
    'praise': '99',
    'status': '1',
    'uname': 'autotester@autotest.com',
    'product_id': 000,
    # 'img_link': ['//cn.cdn.shoplazza.com/d330406101ae1c48e33ed1f29f77c8b2.jpg'],
    'ctime': '2018-9-28 10:10:10'
}

shipping_data = {
    "name": "autotest_shipping",
    "areas": [
        {
            "country_code": "CN",
            "country_name": "中国",
            "province_codes": [
                "ALL"
            ]
        }
    ],
    "plans": [
        {
            "name": "price_fee",
            "desc": "price_fee_description",
            "rule_type": "price",
            "rule_range_min": 0,
            "rule_range_max": 0,
            "rule_range_infinite": True,
            "rule_range_unit": "USD",
            "support_cod": True,
            "rate_type": "normal",
            "rate_amount": "0"
         }
        # {
        #     "name": "quantity_fee",
        #     "desc": "quantity_fee_description",
        #     "rule_type": "quantity",
        #     "rule_range_min": 0,
        #     "rule_range_max": 0,
        #     "rule_range_infinite": True,
        #     "rule_range_unit": "件",
        #     "support_cod": True,
        #     "rate_type": "normal",
        #     "rate_amount": "0"
        # },
        # {
        #     "name": "weight_fee",
        #     "desc": "weight_fee_description",
        #     "rule_type": "weight",
        #     "rule_range_min": 0,
        #     "rule_range_max": 0,
        #     "rule_range_infinite": True,
        #     "support_cod": True,
        #     "rate_type": "normal",
        #     "rate_amount": "0",
        #     "rule_range_unit": "g"
        #  }
    ]
}

shipping_merchant_data = {
    "channel_name": "汉邮",
    "client_id": "SHOPLAZZA",
    "secret_key": "cf73b069ff5349d19d9a40583d26283e",
    "name": "hanyou"
}

checkout_order_data = {
    'line_items': [
        {
            'quantity': 1,
            'variant_id': 628,
            'note': ''
        }
    ],
    'refer_info': {
        'source': 'cart'  # source:buy_now/cart
    }
}

# payment_pay_data = {
#     'order_token': 'be6cb44f-402a-4728-84a1-c974ead1e97e',
#     'payment_line': {
#         'id': '058693de-bd49-420d-a54c-e9b5825f77a9',
#         'name': 'Cash on Delivery',
#         'desc': '',
#         'tips': '',
#         'status': 'open',
#         'payment_method': 'cod',
#         'payment_channel': 'cod',
#         'public_key': None
#     },
#     'card_info': {
#
#     },
#     'need_billing_address': 0,
#     'billing_address_info': {
#         'first_name': '',
#         'last_name': '',
#         'address': '',
#         'address1': '',
#         'city': '',
#         'country_code': '',
#         'province_code': '',
#         'zip': ''
#     },
# }

place_order_data = {
    "order_token": "be6cb44f-402a-4728-84a1-c974ead1e97e",
    "shipping_line": {
        "name": "price_fee",
        "desc": "",
        "range_min": "0.00",
        "range_max": "-1.00",
        "range_unit": "",
        "rate_amount": "0.00",
        "shipping_method": "price",
        "payment_list": [
            "cod",
            "online",
            "custom",
            "credit_card"
        ],
        "id": "21"
    },
    "shipping_address": {
        "id": "",
        "first_name": "firstname",
        "last_name": "lastname",
        "phone_area_code": "86",
        "phone": "18888888888",
        "company": "company",
        "email": "12345@autotest.com",
        "country": "China",
        "country_code": "CN",
        "province": "Beijing",
        "province_code": "CN-BJ",
        "address": "address",
        "address1": "address1",
        "zip": "00000",
        "city": "city"
    },
    "discount_code": "",
    "prices": {
        "total_price": 444,
        "subtotal_price": 444,
        "shipping_price": 0,
        "tax_price": 0,
        "discount_price": 0,
        "discount_line_item_price": 0,
        "discount_code_price": 0
    },
    "customer_info": {
        "note": "",
        "newsletter": 1,
        "email": "12345@autotest.com"
    },
    "save_address": 1,
}

complete_order_data = {
    "order_token": "2b70993f-7030-4ac2-b254-5fa99f939749",
    "shipping_address": {
        "id": "",
        "first_name": "firstname",
        "last_name": "lastname",
        "phone_area_code": "86",
        "phone": "18888888888",
        "company": "company",
        "email": "12345@autotest.com",
        "country": "China",
        "country_code": "CN",
        "province": "Beijing",
        "province_code": "CN-BJ",
        "address": "address",
        "address1": "address1",
        "zip": "00000",
        "city": "city"
    },
    "discount_code": "",
    "prices": {
        "total_price": "14.32",
        "subtotal_price": 12,
        "shipping_price": 1,
        "tax_price": "1.32",
        "discount_price": 0,
        "discount_line_item_price": 0,
        "discount_code_price": 0
    },
    "customer_info": {
        "note": "",
        "newsletter": 1,
        "email": "12345@autotest.com"
    },
    "payment_line": {
        "id": "16cb2d29-a59c-4c1f-a5c6-b6132fadbff8",
        "name": "Cash on Delivery",
        "desc": "",
        "tips": "",
        "status": "open",
        "payment_method": "cod",
        "payment_channel": "cod",
        "public_key": None
    },
    "save_address": 0,
}

payment_pay_data = {
    "order_token": "08cd989d-a307-4b45-bc7d-03b592818580",
    "payment_line": {
        "id": "16cb2d29-a59c-4c1f-a5c6-b6132fadbff8",
        "name": "Cash on Delivery",
        "desc": "",
        "tips": "",
        "status": "open",
        "payment_method": "cod",
        "payment_channel": "cod",
        "public_key": None
    },
    "card_info": {
    },
    "use_shipping_address": 0,
    "billing_address": {
        "area": None,
        "id": "",
        "first_name": "firstname",
        "last_name": "lastname",
        "phone_area_code": "86",
        "phone": "18888888888",
        "company": "company",
        "email": "12345@autotest.com",
        "country": "China",
        "country_code": "CN",
        "province": "Beijing",
        "province_code": "CN-BJ",
        "address": "address",
        "address1": "address1",
        "zip": "00000",
        "city": "city"
    }
}

price_data = {
    "discount_code": "",
    "order_token": "6743fc83-812f-400c-96fc-d418b337ef44",
    "shipping_address": {
        "area": None,
        "id": "",
        "first_name": "firstname",
        "last_name": "lastname",
        "phone_area_code": "86",
        "phone": "18888888888",
        "company": "company",
        "email": "12345@autotest.com",
        "country": "China",
        "country_code": "CN",
        "province": "Beijing",
        "province_code": "CN-BJ",
        "address": "address",
        "address1": "address1",
        "zip": "00000",
        "city": "city"
    },
    "shipping_line": {
        "id": "031cc1a6-29df-4921-b4f1-6f05d667a83f",
        "shipping_id": "32d1e799-84da-4a6c-bc53-d40a4a1b61b6",
        "name": "price_fee",
        "desc": "price_fee_description",
        "support_cod": 1,
        "rule_type": "price",
        "rule_range_min": "0.00",
        "rule_range_max": "0.00",
        "rule_range_infinite": 1,
        "rule_range_unit": "USD",
        "rate_type": "normal",
        "rate_amount": "0.00",
        "rate_first_range": "0.00",
        "rate_first_unit": "g",
        "rate_additional_amount": "0.00",
        "rate_additional_range": "0.00",
        "rate_additional_unit": "g",
        "store_id": 13710,
        "created_at": "2019-01-16 16:15:26",
        "updated_at": "2019-01-16 16:15:26",
        "shipping_price": 0
    },
    "use_discount_code": 0
}

# /api/payment/method这个接口的编辑数据
payment_method_edit_data = {
    "method_name": "Cash on Delivery",
    "method_desc": "desc",
    "method_tips": "tips",
    "payment_method": "cod"
}

payment_channel_data = {
    "client_id": "10000009446",
    "secret_key": "30820122300d06092a864886f70d01010105000382010f003082010a028201010098da23b3f3e679efb33e8171191"
                  "e165ca1a757e53e74393cd23a0bf9adbbaecdd8224c4666ed421ce6b099e66807e85e4247c07261792a66ccbd71cc"
                  "8fb7e87c34e2bcf2ffb5df9004488ec3a32353e91cadc56cf980eda1784186c1c270587907e2db749fd904dc39b28"
                  "670699dd654a6001e0289e2988648ae3fca5e45ed356d1a81a84029357eb017f925c8dc174ce82ac12b8681282abb"
                  "5e83aef1fa6416f3fba32cb45432f51a700f995ccee4d8a9dea66d31607f14a546011ec44807056f54330389e78b1"
                  "2d355527ab62e904f8918c8f417e0afaf154b772fc5dce7aac4a71426f9a623155484d8c7f73e2511f1866661b3a8"
                  "083ea087f3162cf3aa090203010001",
    "payment_method": "credit_card",
    "payment_channel": "ipaylinks"
}

cart_add_data = {
    'product_id': '601',
    'variant_id': '641',
    'quantity': '1',
    'ref': '',
}

shipping_lines_data = {
    'country_code': 'CN',
    'province_code': 'CN-BJ',
    'order_token': '2e043a92-46c5-4f26-953a-88f347cd1e08'
}

# 订单列表数据查询入参数据
query_orders_data = {
    'page': '1',
    'per_page': '10',
    'deal_status': 'dealing'
}

# 通用列表数据查询入参数据
query_list_data = {
    'page': '0',
    'limit': '20'
}

orders_fulfillments_data = {
    "line_item_ids": [
        "016c78d3-4d40-4b90-904a-03da5e40540d",
        "37db26d6-18c6-4b9f-b366-8e19f31eccc5"
    ],
    "retrieve_method": "manual",
    "tracking_number": "autotest_tracking_number",
    "tracking_company": "其他",
    "tracking_company_code": "-1"
}

checkout_settings_data = {
    "customer_authority": "all",
    "checkout_page_type": "normal",
    "address_setting": {
        "email": "hidden",
        "name": "separate",
        "phone": "required",
        "company": "optional"
    }
}

# tax_batch_data = [{
#     "status": "open",
#     "province_code": "ALL",
#     "tax_rate": "60",
#     "country_code": "CN",
#     "province_info": [],
#     "id": "298518"
# }]

tax_batch_data = [{
    "id": "303766",
    "country_code": "CN",
    "province_code": "ALL",
    "tax_rate": 20
}]

coupon_code_refresh_data = {
    "id": "0",
    "title": "autotest_activity_name",
    "code": "YNVK4IR0",
    "value": "",
    "starts_at": "1548086400",
    "ends_at": "-1",
    "value_type": "percentage",
    "prerequisite": "2",
    "usage_limit": "100",
    "once_per_customer": "2",
    "target_selection": "entitled",
    "progress": "",
    "prerequisite_quantity_range":[
        {
            "value": "88",
            "greater_than_or_equal_to": "3"
        }
    ],
    "prerequisite_subtotal_range": None,
    "entitled_product_ids": ["4cc51414-57c7-42d4-a3ee-d86f9f2a8d20"],
    "entitled_variant_ids": [],
    "times_used": "",
    "stock": "",
    "config": {
        "banner_url": "",
        "count_down": {
            "background_color": "rgba(246,246,246,1)",
            "color": "rgba(102,102,102,1)",
            "highlight_color": "rgba(255,51,51,1)"
        }
    }
}

store_data = {
    "store_id": "2740",
    "name": "homer",
    "email": "autotest@autotest.com",
    "currency": "USD",
    "url": "",
    "service_email": "autotest@autotest.com",
    "icon": {
        'src': '//cdn.shoplazza.com/c9f9562678e0febfde4d739a941484fc.jpg',
        'alt': '',
        'path': 'c9f9562678e0febfde4d739a941484fc.jpg'
    },
    "time_zone": "+0800",
    "country_code": "",
    "province_code": "ALL",
    "city": "",
    "address": "",
    "zip": "",
    "phone": "",
    "code": "",
    "symbol_left": "$",
    "symbol_right": "",
    "hour": 8,
    "symbol": "$",
    "id": "940db9ba-69c1-4547-89a6-6fdb7caa142c",
    "created_at": "2018-12-05 13:33:34",
    "updated_at": "2018-12-05 15:01:16",
    "country": "",
    "province": "ALL"
}

file_list_data = {
    'folder': 'product',
    'page': '1',
    'limit': '10'
}

rebate_list_data = {
    'keywords': '',
    'type': -1,
    'progress': 1,
    'page': 1
}

rebate_select_product_data = {
    "collection_id": -1,
    "title": "",
    "status": -1,
    "page": 0,
    "limit": 20,
    "starts_at": 1547136000,
    "ends_at": -1,
    "discount_id": -1
}

coupon_select_product_data = {
    "collection_id": -1,
    "title": "",
    "status": -1,
    "page": 1,
    "limit": 20,
    "starts_at": 1548086400000,
    "ends_at": -1,
    "discount_id": 0
}

rebate_refresh_data = {
    "id": "",
    "title": "auto_rebate",
    "starts_at": "1547136000",
    "ends_at": "-1",
    "value_type": "fixed_amount",
    "allocation_limit": 0,
    "target_selection": "entitled",
    "entitled_product_ids": [],
    "entitled_variant_ids": [],
    "prerequisite_subtotal_range": [{"value": "50", "greater_than_or_equal_to": "100"}],
    "prerequisite_quantity_range": None,
    "progress": "",
    "config": {"banner_url": "",
               "count_down": {"background_color": "rgba(246,246,246,1)", "color": "rgba(102,102,102,1)",
                              "highlight_color": "rgba(255,51,51,1)"}}
}

customer_data = {
    "first_name": "firstname",
    "last_name": "lastname",
    "email": "1111@autotest.com",
    "phone": "18888888888",
    "phone_area_code": "CN_86",
    "newsletter": True
}

popups_data = {
    "starts_at": "1543440306",
    "ends_at": -1,
    "name": "Subscribe for Newsletter",
    "theme": "template1",
    "type": "1",
    "pages_type": 1,
    "page_list": [

    ],
    "page_list_selected": [

    ],
    "page_list_user_defined": [

    ],
    "title_before": "Autotest_before_subscription",
    "description_before": "Join our email list to receive updates and exclusive offers directly in your inbox.",
    "title_after": "Autotest_after_subscription",
    "description_after": "We look forward to keeping you posted.",
    "frequency_type": 1,
    "frequency_num": 1,
    "target_user": 1,
    "bg_color": "rgba(255, 255, 255, 1)",
    "title_color": "rgba(0, 0, 0, 1)",
    "description_color": "rgba(99, 99, 99, 1)",
    "btn_bg_color": "rgba(0, 0, 0, 1)",
    "close_link_color": "rgba(0, 0, 0, 1)",
    "error_msg_color": "rgba(225, 32, 32, 1)",
    "btn_text_color": "rgba(255, 255, 255, 1)",
    "end_unlimited": True,
    "source": "prototype"
}

setting_checkout_data = {
    "customer_authority": "all",
    "checkout_page_type": "single",
    "address_setting": {"email": "optional", "name": "separate", "phone": "optional", "company": "optional"}
}
