#! /bin/bash
KranulVer="44"
branch="r7/hmp"
CODENAME="X01BD"
WithSpec="Y"
PrivBuild="N"
PureKernel="N"
CUSKERNAME="bibi094" # Add "DCKN" on ResetBranch if u don't want Kernel Name Changed again
CUSKERLINK="https://github.com/bibi09456/android_kernel_asus_sdm660"
CUSBUILDDATE=""
CUSSPEC=""
CUSCLANGVER=""
CUSLLDVER=""
CUSMSGWORD=""
TypeBuild="TEST"
BuilderKernel="sdclang"

if [ "$KranulVer" = "419" ];then
CAFTAG="04300"
fi

if [ "$BuilderKernel" != "proton" ] && [ "$BuilderKernel" != "dtc" ] && [ "$BuilderKernel" != "gcc" ] && [ "$BuilderKernel" != "gcc12" ] && [ "$BuilderKernel" != "storm" ] && [ "$BuilderKernel" != "strix" ] && [ "$BuilderKernel" != "sdclang" ] && [ "$BuilderKernel" != "atom" ] && [ "$BuilderKernel" != "zyc" ] && [ "$BuilderKernel" != "neutron" ];then
    exit;
fi

source main.sh

getInfo ">> Starting Build . . . . <<"
if [ ! -z "$CUSKERNAME" ];then
ChangeKName "$CUSKERNAME"
fi

if [ "$PureKernel" == "N" ] && [ $TypeBuild = "RELEASE" ];then
BuildAll
else
SwitchDevice "M1"
ResetBranch
StockFreq
CompileKernel
fi;
