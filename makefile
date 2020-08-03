
%.o : %.md
	markdown -o $@ $< 

all: openpad.o
	cat header.html > tmp
	cat openpad.o >> tmp
	cat footer.html >> tmp
	mv tmp openpad.html

