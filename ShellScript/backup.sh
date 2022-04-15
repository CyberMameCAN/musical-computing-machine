#!/bin/bash

DB_NAME=【データベース名】
DB_USER=【データベースのユーザ名】
DB_PASSWORD=【データベースのパスワード】
KEEPDAY=7  # バックアップファイルを保存しておく期間(日)
INTERVAL_DAY=3  # バックアップ間隔(日)

PREFIX=【バックアップ名】
SERVER=localhost
NOWDATE=`date +%Y%m%d`
NOWDAY=`date +%d`
DESTDIR=【バックアップする場所】
DUMPFILE=$PREFIX.$NOWDATE.dump.gz
SRCDIR=【ワードプレスのソースがある場所】
SRCTARFILE=$PREFIX.$NOWDATE.src.tar.gz


cd $DESTDIR
# MySQLダンプ（zipで圧縮する）
echo $DUMPFILE
mysqldump --single-transaction -u $DB_USER -p$DB_PASSWORD $DB_NAME --opt | gzip > $DUMPFILE

# ソーフファイルはインターバル（INTERVAL_DAY）を指定してバックアップを取る事にする
if [ `expr $NOWDAY % $INTERVAL_DAY` == 0 ]; then
  #ログは出さない
  echo $SRCTARFILE
  tar zcf $SRCTARFILE $SRCDIR
fi

# 処理判定
# $? 直前のコマンドの結果が入っている 0:成功1:失敗
# -o 条件式1 -o 条件式2  条件式1または条件式2の結果のいずれかが真であれば真を返す
# -e ファイル  指定したファイルが存在すれば真を返す
if [ ! -e $TARFILE ]; then
    echo "backup faild -- ($DUMPFILE)"
    exit 1
fi
if [ ! -e $SRCTARFILE ]; then
    echo "backup faild -- ($SRCTARFILE)"
    exit 1
fi

# 古くなったファイルを削除
echo "以下のファイルを削除しました"
find . -mtime +$KEEPDAY
find . -mtime +$KEEPDAY -exec rm -f {} \;
echo "終了！"
