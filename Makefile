CC=gcc
FLAGS = -Wall -g
ALL_M= mains maindloop maindrec

all:$(ALL_M)

libclassloops.a: basicClassification.o advancedClassificationLoop.o
	ar -rcs libclassloops.a basicClassification.o advancedClassificationLoop.o

recursives: basicClassification.o advancedClassificationRecurtion.o
	ar -rcs libclassrec.a basicClassification.o advancedClassificationRecurtion.o

libclassrec.so: basicClassification.o advancedClassificationRecurtion.o
	gcc -shared -o libclassrec.so basicClassification.o advancedClassificationRecurtion.o

loopd: basicClassification.o advancedClassificationLoop.o
	gcc -shared -o libclassloops.so basicClassification.o advancedClassificationLoop.o

mains: main.o recursives
	gcc $(FLAGS) -o mains main.o ./libclassrec.a

maindloop: main.o loopd
	gcc -fPIC $(FLAGS) main.o ./libclassloops.so -o maindloop

maindrec: main.o recursived
	gcc -fPIC $(FLAGS) main.o ./libclassrec.so -o maindrec 

main.o: main.c NumClass.h
	gcc $(FLAGS) -c main.c

basicClassification.o: basicClassification.c
	gcc $(FLAGS) -c basicClassification.c
advancedClassificationRecursion.o: advancedClassificationRecursion.c
	gcc $(FLAGS) -c advancedClassificationRecursion.c
advancedClassificationLoop.o: advancedClassificationLoop.c
	gcc $(FLAGS) -c advancedClassificationLoop.c

clean:
	rm -f *.o *.a *.so $(ALL_M)

