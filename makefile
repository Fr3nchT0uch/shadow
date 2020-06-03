#
DISKNAME = test.dsk

PYTHON = python.exe
JAVA = java.exe -jar
ACME = acme.exe -f plain -o
AC = $(JAVA) $(A2SDK)\bin\ac.jar 
LZ4 = lz4.exe
ZPACK = zpacker.exe
DIRECTWRITE = $(PYTHON) $(A2SDK)\bin\dw.py
TRANSAIR = $(PYTHON) $(A2SDK)\bin\transair.py
GENDSK = $(PYTHON) $(A2SDK)\bin\genDSK.py
COPYFILES = $(PYTHON) $(A2SDK)\bin\InsertZIC.py
APPLEWIN = $(APPLEWINPATH)\Applewin.exe -d1

EMULATOR = $(APPLEWIN)

all: $(DISKNAME)

$(DISKNAME): shadow.b 
#	REMOVE OLD FILE (mandatory)
	$(AC) -d $(DISKNAME) SHADOW
# 	COPY TO DSK
	$(AC) -p $(DISKNAME) SHADOW B $50 <shadow.b

# 	EMULATOR
	copy lbl_shadow.txt $(APPLEWINPATH)\A2_USER1.SYM
	copy test.dsk $(APPLEWINPATH)\tmp.dsk
	$(EMULATOR) $(APPLEWINPATH)\tmp.dsk

shadow.b: shadow.a
	$(ACME) shadow.b shadow.a


clean:
	del *.b
	del lbl_*.txt
    