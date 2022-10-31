CXX	=	g++

PRINT	=	echo -e

NO_PRINT = --no-print-directory

RM		=	rm -f

NAME	=	torrent_client

INCLUDE	=	-I./include/

DEBUGFLAG	=	-g3

ROOT	=	src

VG		=	vgcore.*

CXXFLAGS	=	$(INCLUDE) $(DEBUGFLAG) `wx-config --cxxflags --libs`

SRC	=	$(ROOT)/main.cpp	\

OBJ	=	$(SRC:.cpp=.o)

$(OBJDIR)%.o:		%.cpp
			@$(CXX) $(CXXFLAGS) -o $@ -c $<
			@if test -s $*.c; then \
			$(PRINT) "\033[01m\033[35m Compiling \033[00m\
			\033[36m$(SRCPATH)$*.c\033[032m  [OK]\033[00m";\
			else \
			$(PRINT) "\033[01m\033[33m Compiling \033[00m\
			\033[36m$(SRCPATH)$*.c\033[00m\  [Error]"; fi

$(NAME):		$(OBJ)
			@$(PRINT) "\033[01m\033[31mLinking ...\033[00m"
			@$(CXX) $(OBJ) -o $(NAME) $(CXXFLAGS)
			@$(PRINT) "\033[01m\033[32mCompilation done\033[00m"

all:		$(NAME)

clean:
		@$(REV_CCLIB)
		@$(RM) $(OBJ)
		@$(RM) $(USELESS_F)
		@$(RM) $(U_F_SRC)
		@$(RM) $(U_F_INC)
		@$(RM) $(VG)
		@$(PRINT) "\033[1;93mRemoving objects ...\033[0m"

fclean: 	clean
		@$(RM) $(NAME)
		@$(PRINT) "\033[1;93mRemoving binary : {${NAME}} ...\033[0m"
		@$(PRINT) "\033[1;92mPROCESS FINISHED [OK]\033[0m"

re:		fclean all

help:
	@$(PRINT) "[press make for compile the project]"

.PHONY:			all debug clean fclean re help
