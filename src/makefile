SRC_PATH := ./
OBJ_PATH := ./obj/
TARGET_PATH := ../

_OBJ := openpad.o beatmania.o crtmod.o site.o nothing.o about.o	minipad.o
#OBJ := $(addprefix $(OBJ_PATH),$(_OBJ))
FINAL := $(_OBJ:.o=.html)
_FINAL := $(addprefix $(TARGET_PATH),$(FINAL))

all : $(_FINAL)
	mkdir obj

# We use .o files to represent html output
FLAGS := toc,footnote
$(OBJ_PATH)%.o : $(SRC_PATH)%.md
	markdown -f $(FLAGS) -o $@ $< 

# Now let's add the place the .o inside our html template
MACROS   := macros.m4
TEMPLATE := template.html.m4
$(TARGET_PATH)%.html : $(OBJ_PATH)%.o  $(MACROS) $(TEMPLATE)
	@echo $<
	
	@# Define a macro __PAGEURL to point to target
	m4 -P $(MACROS) -D__PAGEURL=$(subst $(TARGET_PATH),,$@) $< $(TEMPLATE) > $@
	@# let's clutter the ../ directory

#cleaning up the metadata of jpeg images
IMAGES := ../img/
sanitize_metadata:  
	exiftool -all= $(IMAGES) -v

.PHONY: clean
clean:
	rm -f $(OBJ_PATH)*.o *~


