# --- MACROS
# define program name
MAIN= apriori

# define the C compiler to use
CC= gcc

# define any compile-time flags
CFLAGS= -Wall -pedantic

# Make with "make RELEASE=1" for release build
ifndef RELEASE
	CFLAGS+= -pg -O2 -g
else
	CFLAGS+= -O3
endif

# define any libraries to link into executable
LIBS= -lm

# define C source files
SRCS= src/apriori.c src/main.c

# define C header files
HDRS= src/apriori.h

# --- TARGETS
all: ${MAIN}

#Builds the program
${MAIN}: ${SRCS} ${HDRS}
	@echo #
	@echo "-- BUILDING PROGRAM --"
	${CC} ${SRCS} -pg ${LIBS} -o ${MAIN}

clean:
	@echo #
	@echo "-- CLEANING PROJECT FILES --"
	$(RM) *.o ${MAIN}
