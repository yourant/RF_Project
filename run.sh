#!/bin/bash

export PATH=$PATH:/usr/local/bin/



#定义选项， -o 表示短选项 -a 表示支持长选项的简单模式(以 - 开头) -l 表示长选项
# a 后没有冒号，表示没有参数
# b 后跟一个冒号，表示有一个必要参数
# c 后跟两个冒号，表示有一个可选参数(可选参数必须紧贴选项)
# -n 出错时的信息
# -- 也是一个选项，比如 要创建一个名字为 -f 的目录，会使用 mkdir -- -f ,
#    在这里用做表示最后一个选项(用以判定 while 的结束)
# $@ 从命令行取出参数列表(不能用用 $* 代替，因为 $* 将所有的参数解释成一个字符串
#                         而 $@ 是一个参数数组)

# R:rerun       是否需要重跑
# E:email       是否需要发邮件
# P:password    用户密码
# O:domain      测试域名
# A:account     测试账号
# M:module      被测试用例模块
# U:url         被测url
# D:dir         报告存放位置
# T:timestamp   用例执行时间搓
# H:host        用例执行环境（美服，测试服，预发布）


TEMP=`getopt -o REP:O:A:M:U:D:T:H: -l rerun,email,password:,domain:,account:,module:,url:,dir:,timestamp:,host: -- "$@"`

#显示除选项外的参数(不包含选项的参数都会排到最后)
# arg 是 getopt 内置的变量 , 里面的值，就是处理过之后的 $@(命令行传入的参数)
args=''
for arg do
   args="$args"" $arg" ;
done
sub_args=${args#*-M}
# 获取所有入参用例模块
MODULES=${sub_args%%-*}

# 默认log文件路径
FILE_ABS_PATH=$(cd `dirname $0`; pwd)
TEST_LOG_DIR=$FILE_ABS_PATH/"logs"

# 默认时间搓
TIMESTAMP=`date "+%Y%m%d%H%M%S"`




# 判定 getopt 的执行时候有错，错误信息输出到 STDERR
if [ $? != 0 ]
then
	echo "Terminating....." >&2
	exit 1
fi

# 重新排列参数的顺序
# 使用eval 的目的是为了防止参数中有shell命令，被错误的扩展。
eval set -- "$TEMP"




# 处理具体的选项
while true
do
	case "$1" in
		-E | --email)
			SEND_EMAIL='yes'
			shift
			;;
		-P | --password)
			TEST_PASSWORD="$2"
			shift 2
			;;
		-O | --domain)
			TEST_DOMAIN="$2"
			shift 2
			;;
		-A | --account)
			TEST_ACCOUNT="$2"
			shift 2
			;;
		-R | --rerun)
			TEST_RERUN='yes'
			shift
			;;
		-H | --host)
			TEST_HOST="$2"
			shift 2
			;;
		-M | --module)
			TEST_MODULE="$MODULES"
			shift 2
			;;
		-U | --url)
			TEST_URL="$2"
			shift 2
			;;
		-D | --dir)
			TEST_LOG_DIR="$2"
			shift 2
			;;
		-T | --timestamp)
			TIMESTAMP="$2"
			shift 2
			;;
		--)
			shift
			break
			;;
		*)
			echo "Internal error!"
			exit 1
			;;
	esac
done


#ARGS=()
#if [ "$TEST_URL" ]
#then
#	ARGS=( "${ARGS[@]}" " --url=$TEST_URL" )
#fi
#if [ "$TEST_ACCOUNT" ]
#then
#	ARGS=( "${ARGS[@]}" " --user=$TEST_ACCOUNT" )
#fi
#if [ "$TEST_HOST" ]
#then
#	ARGS=( "${ARGS[@]}" " --host=$TEST_HOST" )
#fi
#
#if [ "$TEST_URL" -o "$TEST_ACCOUNT" -o "$TEST_HOST" ]
#then
#	echo "${ARGS[@]}"
#	python2.7 lib/customlib/initevn.py "${ARGS[@]}"
#else
#	echo 'not TEST_URL and TEST_ACCOUNT and TEST_HOST'
#fi
echo TEST_URL:"$TEST_URL"
echo TEST_ACCOUNT:"$TEST_ACCOUNT"
echo TEST_HOST:"$TEST_HOST"
echo TEST_PASSWORD:"$TEST_PASSWORD"
echo TEST_DOMAIN:"$TEST_DOMAIN"

# 1、执行initevn.py
if [ "$TEST_URL" -a "$TEST_ACCOUNT" -a "$TEST_HOST" -a "$TEST_PASSWORD" -a "$TEST_DOMAIN" ]
then
	echo 'TEST_URL and TEST_ACCOUNT and TEST_HOST and TEST_PASSWORD and $TEST_DOMAIN'
    python2.7 lib/customlib/initevn.py --url="$TEST_URL" --user="$TEST_ACCOUNT" --host="$TEST_HOST" --domain="$TEST_DOMAIN" --password="$TEST_PASSWORD"
elif [ "$TEST_URL" -a "$TEST_ACCOUNT" -a ! "$TEST_HOST" -a "$TEST_PASSWORD" -a "$TEST_DOMAIN" ]
then
	echo 'TEST_URL and TEST_ACCOUNT and not TEST_HOST and TEST_PASSWORD and $TEST_DOMAIN'
    python2.7 lib/customlib/initevn.py --url="$TEST_URL" --user="$TEST_ACCOUNT" --domain="$TEST_DOMAIN" --password="$TEST_PASSWORD"
elif [ "$TEST_URL" -a "$TEST_ACCOUNT" -a "$TEST_HOST" ]
then
	echo 'TEST_URL and TEST_ACCOUNT and TEST_HOST'
    python2.7 lib/customlib/initevn.py --url="$TEST_URL" --user="$TEST_ACCOUNT" --host="$TEST_HOST"
elif [ ! "$TEST_URL" -a "$TEST_ACCOUNT" -a "$TEST_HOST" ]
then
	echo 'not TEST_URL and TEST_ACCOUNT and TEST_HOST'
    python2.7 lib/customlib/initevn.py --user="$TEST_ACCOUNT" --host="$TEST_HOST"
elif [ "$TEST_URL" -a ! "$TEST_ACCOUNT" -a "$TEST_HOST" ]
then
	echo 'TEST_URL and not TEST_ACCOUNT and TEST_HOST'
    python2.7 lib/customlib/initevn.py --url="$TEST_URL" --host="$TEST_HOST"
elif [ "$TEST_URL" -a "$TEST_ACCOUNT" -a ! "$TEST_HOST" ]
then
	echo 'TEST_URL and TEST_ACCOUNT and not TEST_HOST'
    python2.7 lib/customlib/initevn.py --url="$TEST_URL" --user="$TEST_ACCOUNT"
elif [ ! "$TEST_URL" -a ! "$TEST_ACCOUNT" -a "$TEST_HOST" ]
then
	echo 'not TEST_URL and not TEST_ACCOUNT and TEST_HOST'
    python2.7 lib/customlib/initevn.py --host="$TEST_HOST"
elif [ "$TEST_URL" -a ! "$TEST_ACCOUNT" -a ! "$TEST_HOST" ]
then
	echo 'TEST_URL and not TEST_ACCOUNT and not TEST_HOST'
    python2.7 lib/customlib/initevn.py --url="$TEST_URL"
elif [ ! "$TEST_URL" -a "$TEST_ACCOUNT" -a ! "$TEST_HOST" ]
then
	echo 'not TEST_URL and TEST_ACCOUNT and not TEST_HOST'
    python2.7 lib/customlib/initevn.py --user="$TEST_ACCOUNT"
else
	echo 'not TEST_URL and not TEST_ACCOUNT and not TEST_HOST'
fi

# 2、exec testcases
if [ "$TEST_MODULE" ]
then
	echo "$TEST_MODULE"
    robot -v is_headless:True -d "$TEST_LOG_DIR"/ $TEST_MODULE

    # 3、rerun the failed testcases
	if [ "$TEST_RERUN" ]
	then
		echo "TEST_RERUN"
		# rerun first time
	    robot -v is_headless:True --rerunfailed "$TEST_LOG_DIR"/output.xml -d "$TEST_LOG_DIR"/rerun/ $TEST_MODULE
	    if [ -d "$TEST_LOG_DIR/rerun" ]
	    then
			# 使用当前logs/output.xml文件的<suite>替换logs/rerun/output.xml的
			# 这样rebot --merge才通过
			line=`grep '<suite .*id="s1".*>' "$TEST_LOG_DIR"/output.xml`
			sed -i "3d" "$TEST_LOG_DIR"/rerun/output.xml
			sed -i "2a$line" "$TEST_LOG_DIR"/rerun/output.xml
			rebot --merge -d "$TEST_LOG_DIR"/ -o output.xml "$TEST_LOG_DIR"/output.xml "$TEST_LOG_DIR"/rerun/output.xml
		fi
		# rerun second time
		robot -v is_headless:True --rerunfailed "$TEST_LOG_DIR"/output.xml -d "$TEST_LOG_DIR"/rerun1/ $TEST_MODULE
		if [ -d "$TEST_LOG_DIR/rerun" ]
	    then
			# 使用当前logs/output.xml文件的<suite>替换logs/rerun1/output.xml的
			# 这样rebot --merge才通过
			line=`grep '<suite .*id="s1".*>' "$TEST_LOG_DIR"/output.xml`
			sed -i "3d" "$TEST_LOG_DIR"/rerun1/output.xml
			sed -i "2a$line" "$TEST_LOG_DIR"/rerun1/output.xml
			rebot --merge -d "$TEST_LOG_DIR"/ -o output.xml "$TEST_LOG_DIR"/output.xml "$TEST_LOG_DIR"/rerun1/output.xml
		fi
	else
		echo 'not TEST_RERUN'
	fi
else
	echo 'not TEST_MODULE'
#    robot -v is_headless:True -d "$TEST_LOG_DIR"/ \
#		module/00_login/login.robot \
#		module/00_login/logout.robot \
#		module/02_order/* \
#		module/03_product/* \
#		module/06_marketing/01_coupon_code/coupon_code_smoke.robot \
#		module/07_decoration/02_checkout_process/setings_checkout.robot \
#		module/08_settings/01_basic_info/store.robot \
#		module/08_settings/03_shipping/shipping.robot \
#		module/08_settings/04_tax/tax_rate.robot \
#		module/08_settings/07_file_management/file_management.robot \
#		module/09_checkout/01_Checkout_Normal_Page/*
#	robot -v is_headless:True --rerunfailed "$TEST_LOG_DIR"/output.xml -d "$TEST_LOG_DIR"/rerun/ \
#		module/00_login/login.robot \
#		module/00_login/logout.robot \
#		module/02_order/* \
#		module/03_product/* \
#		module/06_marketing/01_coupon_code/coupon_code_smoke.robot \
#		module/07_decoration/02_checkout_process/setings_checkout.robot \
#		module/08_settings/01_basic_info/store.robot \
#		module/08_settings/03_shipping/shipping.robot \
#		module/08_settings/04_tax/tax_rate.robot \
#		module/08_settings/07_file_management/file_management.robot \
#		module/09_checkout/01_Checkout_Normal_Page/*
fi

# 4、执行email_utils.py
if [ "$SEND_EMAIL" ]
then
	echo 'SEND_EMAIL_DEFAULT'
    python2.7 lib/utils/email_utils.py --timestamp "$TIMESTAMP" --log_path "$TEST_LOG_DIR"
fi