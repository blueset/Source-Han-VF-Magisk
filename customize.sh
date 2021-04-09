# Fork from https://github.com/simonsmh/notocjk/blob/master/customize.sh
[ -x "$(which magisk)" ] && MIRRORPATH=$(magisk --path)/.magisk/mirror || unset MIRRORPATH
FILE=fonts.xml
FILEPATH=/system/etc/
FONTPATH=/system/fonts/
SERIFNAME=SourceHanSerif.ttc
CHECKSUM=$SERIFNAME.sha256
REALSUM=$SERIFNAME.caculated.sha256

if [ "$API" -ge "28" ] && [ -f $MIRRORPATH$FILEPATH$FILE ]; then
    ui_print "- Merging SourceHanSerif.ttc"
    cat $MODPATH$FONTPATH$SERIFNAME.part* > $MODPATH$FONTPATH$SERIFNAME
    sha256sum $MODPATH$FONTPATH$SERIFNAME | awk '{print $1}' > $MODPATH$FONTPATH$REALSUM

    if ! cmp -s $MODPATH$FONTPATH$CHECKSUM $MODPATH$FONTPATH$REALSUM; then
        abort "! File corrupted. Please re-download this module."
    else
        ui_print "- cleaning cache file"
        rm $MODPATH$FONTPATH$SERIFNAME.* 2> /dev/null
    fi

    ui_print "- Migrating fonts.xml"
    mkdir -p $MODPATH$FILEPATH
    cp -af $MIRRORPATH$FILEPATH$FILE $MODPATH$FILEPATH$FILE
    sed -i '
    /<family lang=\"zh-Hans\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
    s/<family lang=\"zh-Hans\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hans">\n        <font weight="250" style="normal" index="3">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="0.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="3">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="160.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="3">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="320.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="3">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="420.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="3">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="560.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="3">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="780.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="3">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="1000.0" \/>\n        <\/font>\n        <font weight="250" style="normal" index="2" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="300" style="normal" index="6" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="400" style="normal" index="10" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="500" style="normal" index="14" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="600" style="normal" index="18" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="700" style="normal" index="22" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="900" style="normal" index="26" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n    <\/family>/};
    ' $MODPATH$FILEPATH$FILE
    sed -i '
    /<family lang=\"zh-Hant\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
    s/<family lang=\"zh-Hant\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hant">\n        <font weight="250" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="0.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="160.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="320.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="420.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="560.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="780.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="1000.0" \/>\n        <\/font>\n        <font weight="250" style="normal" index="3" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="300" style="normal" index="7" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="400" style="normal" index="11" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="500" style="normal" index="15" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="600" style="normal" index="19" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="700" style="normal" index="23" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="900" style="normal" index="27" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n    <\/family>/};
    ' $MODPATH$FILEPATH$FILE
    sed -i '
    /<family lang=\"zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
    s/<family lang=\"zh-Bopo\">.*Noto.*CJK.*<\/family>/<family lang="zh-Bopo">\n        <font weight="250" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="0.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="160.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="320.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="420.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="560.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="780.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="1000.0" \/>\n        <\/font>\n        <font weight="250" style="normal" index="3" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="300" style="normal" index="7" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="400" style="normal" index="11" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="500" style="normal" index="15" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="600" style="normal" index="19" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="700" style="normal" index="23" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="900" style="normal" index="27" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n    <\/family>/};
    ' $MODPATH$FILEPATH$FILE
    sed -i '
    /<family lang=\"zh-Hant zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
    s/<family lang=\"zh-Hant zh-Bopo\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hant zh-Bopo">\n        <font weight="250" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="0.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="160.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="320.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="420.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="560.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="780.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="1000.0" \/>\n        <\/font>\n        <font weight="250" style="normal" index="3" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="300" style="normal" index="7" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="400" style="normal" index="11" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="500" style="normal" index="15" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="600" style="normal" index="19" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="700" style="normal" index="23" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="900" style="normal" index="27" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n    <\/family>/};
    ' $MODPATH$FILEPATH$FILE
    sed -i '
    /<family lang=\"zh-Hant,zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
    s/<family lang=\"zh-Hant,zh-Bopo\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hant,zh-Bopo">\n        <font weight="250" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="0.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="160.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="320.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="420.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="560.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="780.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="4">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="1000.0" \/>\n        <\/font>\n        <font weight="250" style="normal" index="3" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="300" style="normal" index="7" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="400" style="normal" index="11" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="500" style="normal" index="15" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="600" style="normal" index="19" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="700" style="normal" index="23" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="900" style="normal" index="27" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n    <\/family>/};
    ' $MODPATH$FILEPATH$FILE
    sed -i '
    /<family lang=\"ja\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
    s/<family lang=\"ja\">.*Noto.*CJK.*<\/family>/<family lang="ja">\n        <font weight="250" style="normal" index="0">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="0.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="0">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="160.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="0">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="320.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="0">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="420.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="0">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="560.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="0">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="780.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="0">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="1000.0" \/>\n        <\/font>\n        <font weight="250" style="normal" index="0" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="300" style="normal" index="4" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="400" style="normal" index="8" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="500" style="normal" index="12" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="600" style="normal" index="16" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="700" style="normal" index="20" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="900" style="normal" index="24" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n    <\/family>/};
    ' $MODPATH$FILEPATH$FILE
    sed -i '
    /<family lang=\"ko\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
    s/<family lang=\"ko\">.*Noto.*CJK.*<\/family>/<family lang="ko">\n        <font weight="250" style="normal" index="2">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="0.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="2">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="160.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="2">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="320.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="2">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="420.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="2">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="560.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="2">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="780.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="2">SourceHanSans-VF.ttc\n            <axis tag="wght" stylevalue="1000.0" \/>\n        <\/font>\n        <font weight="250" style="normal" index="1" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="300" style="normal" index="5" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="400" style="normal" index="9" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="500" style="normal" index="13" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="600" style="normal" index="17" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="700" style="normal" index="21" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n        <font weight="900" style="normal" index="25" fallbackFor="serif">SourceHanSerif.ttc<\/font>\n    <\/family>/};
    ' $MODPATH$FILEPATH$FILE
else
    abort "! Migration FAILED. Nothing have done to your system."
fi

rm $MODPATH/LICENSE* $MODPATH/*.py 2> /dev/null
