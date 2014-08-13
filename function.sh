#!/bin/sh
addLog()
{
	# $1:内容
	# $2:日志路径
	echo -e $1 >> $2;	
}
setLog()
{
	# $1:内容
	# $2:日志路径
	echo -e $1 > $2;
}
getSvnVersion()
{
	# $1:svn本地工作区
	# $2:svn用户名
	# $3:svn密码
	# grep查找过滤 | cut分割 以“:”取第二块 | tr去除 空格
	echo `svn info --username=$2 --password=$3 $1 | grep "Revision" | cut -d ":" -f 2 | tr -d " "`; #svn本次版本
}
updateSvn()
{
        # $1:svn本地工作区
        # $2:svn用户名
        # $3:svn密码
	echo `svn up --username=$2 --password=$3 $1 | grep "revision"`;
}
setPhpdoc()
{
	# $1:本地源代码路径
	# $2:phpdoc文档生成路径
	echo `phpdoc -d "$1" -t "$2" -ti "$1" -o "HTML:frames:default" | grep "Total Documentation Time"`;
}
getValByKey()
{
	# $1:文件路径
	# $2:要搜索的键值 key:val
	test -f "$1" && tmp=`cat $1 | grep "$2" | cut -d ":" -f 2 | tr -d ""` || tmp="";
	echo $tmp;	
}
