#!/bin/sh
# svn相关设置
g_svn_path="http://svnadmin.xxx.com/xxx";
g_svn_user="user";
g_svn_pwd="pwd";
# 工作目录
g_path="/opt/project1/xxx";
g_path_work="$g_path/project"; #源代码根目录
g_path_phpdoc="/opt/phpdoc/project1/"; #phpdoc生成文档存放目录
# 临时目录
g_log=`pwd`"/svn.log"; #运行日志
g_log_tmp=`pwd`"/svn_tmp.log";
