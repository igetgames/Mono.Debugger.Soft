thisdir = class/Mono.Debugger.Soft
include ../../build/rules.make

LIBRARY = Mono.Debugger.Soft.dll
LIBRARY_SNK = ../mono.snk

LIB_MCS_FLAGS = /r:$(corlib) /r:System.dll /r:Mono.Cecil.dll /r:System.Core.dll /unsafe -D:MONO_DATACONVERTER_STATIC_METHODS -keyfile:$(LIBRARY_SNK)

TEST_MCS_FLAGS = /r:Mono.Cecil.dll

check: dtest-app.exe

dtest-app.exe:
	$(CSCOMPILE) -out:$@ -unsafe -debug Test/dtest-app.cs

CLEAN_FILES = dtest-app.exe dtest-app.exe.mdb

#NO_TEST = yes

ifneq (net_2_0, $(PROFILE))
NO_INSTALL = yes
endif

include ../../build/library.make
