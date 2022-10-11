#! /bin/bash
KranulVer="44"
branch="eas-test"
CODENAME="X01BD"
WithSpec="Y"
PrivBuild="N"
PureKernel="N"
CUSKERNAME="SkyWalker-EAS-BETA" # Add "DCKN" on ResetBranch if u don't want Kernel Name Changed again
CUSKERLINK=""
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
ResetBranch
CompileKernel
StockFreq
CompileKernel
SwitchDevice "M1"
CompileKernel
ResetBranch
CompileKernel
fi;