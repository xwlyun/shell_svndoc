#!/bin/sh
#source /etc/bashrc
source global.sh

now=`date '+%F %T'`;
log="log:$now""\n"; #记录下执行时间

`updateSvn $g_path_work $g_svn_user $g_svn_pwd`;
svn_version_now=`getSvnVersion $g_path_work $g_svn_user $g_svn_pwd`;
log="$log""svn:$svn_version_now""\n"; #记录下执行时的svn版本号

svn_version_tmp=`getValByKey "$g_log_tmp" "svn"`
if [ ! $svn_version_tmp ]; then
	svn_version_tmp=0;
fi

if [ "$svn_version_now" -gt "$svn_version_tmp" ]; then
	#需要更新phpdoc
	log="$log"`setPhpdoc $g_path_work $g_path_phpdoc`"\n";
fi

`setLog "$log" "$g_log_tmp"`;
`addLog "$log" "$g_log"`;


