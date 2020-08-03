ODIR=obj
_OBJ = openpad.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))
OBJ_FINAL = $(OBJ:.o=.html)


$(ODIR)/%.o : %.md
	markdown -o $@ $< 

all: $(OBJ)
	cat header.html > tmp
	cat $(OBJ) >> tmp
	cat footer.html >> tmp
	#rename from *.o to *html and move up directory '..'
	mv tmp $(patsubst %,../%,$(_OBJ:.o=.html)) 

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~
