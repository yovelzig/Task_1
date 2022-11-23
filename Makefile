CC=gcc
FLAGS = -Wall -g
ALL_M= mains maindloop maindrec
 
all:$(ALL_M)

loops: libclassloops.a

recursives: libclassrec.a

recursived: libclassrec.so

loopd: libclassloops.so

libclassloops.a: basicClassification.o advancedClassificationLoop.o
	ar -rcs libclassloops.a basicClassification.o advancedClassificationLoop.o

libclassrec.a: basicClassification.o advancedClassificationRecurtion.o
	ar -rcs libclassrec.a basicClassification.o advancedClassificationRecurtion.o

libclassrec.so:	basicClassification.o advancedClassificationRecurtion.o
	gcc -shared -o libclassrec.so basicClassification.o advancedClassificationRecurtion.o

libclassloops.so: basicClassification.o advancedClassificationLoop.o
	gcc -shared -o libclassloops.so basicClassification.o advancedClassificationLoop.o


mains: main.o libclassrec.a
	gcc $(FLAGS) -o mains main.o libclassrec.a

maindloop: main.o libclassloops.so
	gcc -fPIC $(FLAGS) main.o libclassloops.so -o maindloop

maindrec: main.o libclassrec.so
	gcc -fPIC $(FLAGS) main.o libclassrec.so -o maindrec 

main.o: main.c NumClass.h
	gcc $(FLAGS) -c main.c

basicClassification.o: basicClassification.c
	gcc $(FLAGS) -c basicClassification.c

advancedClassificationRecurtion.o: advancedClassificationRecurtion.c
	gcc $(FLAGS) -c advancedClassificationRecurtion.c

advancedClassificationLoop.o: advancedClassificationLoop.c
	gcc $(FLAGS) -c advancedClassificationLoop.c

clean:
	rm -f *.o *.a *.so $(ALL_M)

.PHONY: clean 