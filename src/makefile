SRC_PATH := ./
OBJ_PATH := ./obj/
TARGET_PATH := ../

_OBJ := openpad.o beatmania.o
#OBJ := $(addprefix $(OBJ_PATH),$(_OBJ))
FINAL := $(_OBJ:.o=.html)
_FINAL := $(addprefix $(TARGET_PATH),$(FINAL))

FLAGS := toc,footnote

$(OBJ_PATH)%.o : $(SRC_PATH)%.md
	markdown -f $(FLAGS) -o $@ $< 

DEPS := $(SRC/PATH)header.html $(SRC_PATH)footer.html

$(TARGET_PATH)%.html : $(OBJ_PATH)%.o  $(DEPS)
	@echo $<
	cat $(SRC_PATH)header.html > tmp
	cat $< >> tmp
	cat $(SRC_PATH)footer.html >> tmp
	#rename from *.o to *html and move up directory '..'
	mv tmp $(addprefix $(TARGET_PATH),$(<F:.o=.html))

all : $(_FINAL)

#cleaning up the metadata of jpeg images
IMAGES := ../img/
sanitize_metadata:  
	exiftool -all= $(IMAGES)

.PHONY: clean

clean:
	rm -f $(OBJ_PATH)*.o *~
