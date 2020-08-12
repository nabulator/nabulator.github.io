ODIR = obj
_OBJ = openpad.o
OBJ = $(addprefix $(ODIR)/,$(_OBJ))
OBJ_FINAL = $(OBJ:.o=.html)


FLAGS = toc,latex
$(ODIR)/%.o : %.md
	markdown -f $(FLAGS) -o $@ $< 

all: $(OBJ)
	cat header.html > tmp
	cat $(OBJ) >> tmp
	cat footer.html >> tmp
	#rename from *.o to *html and move up directory '..'
	mv tmp $(addprefix ../,$(_OBJ:.o=.html)) 

#cleaning up the metadata of jpeg images
IMAGES = ../img
sanitize_metadata:  
	exiftool -all= $(IMAGES)


.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~
