"%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe" GitFor1C.sln /property:Configuration=Release /property:Platform=x64
"%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe" GitFor1C.sln /property:Configuration=Release /property:Platform=x86

oscript .\tools\MakePack.os

mkdir .\Example\Templates\VAEditor
mkdir .\Example\Templates\VAEditor\Ext
copy /b ..\VAEditor\example\VanessaEditorSample\Templates\VanessaEditor\Ext\Template.bin .\Example\Templates\VAEditor\Ext\Template.bin 

mkdir .\Example\Templates\GitFor1C
mkdir .\Example\Templates\GitFor1C\Ext
copy /b .\AddIn.zip .\Example\Templates\GitFor1C\Ext\Template.bin 

oscript .\tools\Compile.os .\