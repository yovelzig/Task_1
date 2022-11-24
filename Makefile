CC=gcc
FLAGS = -Wall -g
ALL_M= mains maindloop maindrec
 
all:$(ALL_M)
mains: main.o libclassrec.a
	$(CC) $(FLAGS) -o mains main.o libclassrec.a

maindloop: main.o libclassloops.so
	$(CC) $(FLAGS) main.o ./libclassloops.so -o maindloop

maindrec: main.o libclassrec.so
	$(CC) $(FLAGS) main.o ./libclassrec.so -o maindrec 

loops: libclassloops.a

recursives: libclassrec.a

recursived: libclassrec.so

loopd: libclassloops.so

libclassloops.a: basicClassification.o advancedClassificationLoop.o
	ar -rcs libclassloops.a basicClassification.o advancedClassificationLoop.o

libclassrec.a: basicClassification.o advancedClassificationRecurtion.o
	ar -rcs libclassrec.a basicClassification.o advancedClassificationRecurtion.o

libclassrec.so:	basicClassification.o advancedClassificationRecurtion.o
	$(CC) -shared -fPIC -o libclassrec.so basicClassification.o advancedClassificationRecurtion.o

libclassloops.so: basicClassification.o advancedClassificationLoop.o
	$(CC) -shared -fPIC -o libclassloops.so basicClassification.o advancedClassificationLoop.o

main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c

basicClassification.o: basicClassification.c
	$(CC) $(FLAGS) -c basicClassification.c

advancedClassificationRecurtion.o: advancedClassificationRecurtion.c
	$(CC) $(FLAGS) -c advancedClassificationRecurtion.c

advancedClassificationLoop.o: advancedClassificationLoop.c
	$(CC) $(FLAGS) -c advancedClassificationLoop.c

clean:
	rm -f *.o *.a *.so $(ALL_M)

.PHONY: clean all