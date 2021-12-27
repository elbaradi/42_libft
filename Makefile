# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: tel-bara <tel-bara@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/10/28 00:17:49 by tel-bara      #+#    #+#                  #
#    Updated: 2021/12/27 13:51:09 by tel-bara      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME	=	libft.a
SRCDIR	=	srcs
SRCS	=	$(SRCDIR)/ft_isalpha.c			\
			$(SRCDIR)/ft_memchr.c			\
			$(SRCDIR)/ft_strchr.c			\
			$(SRCDIR)/ft_strncmp.c			\
			$(SRCDIR)/ft_atoi.c				\
			$(SRCDIR)/ft_isascii.c			\
			$(SRCDIR)/ft_memcmp.c			\
			$(SRCDIR)/ft_strdup.c			\
			$(SRCDIR)/ft_strnstr.c			\
			$(SRCDIR)/ft_bzero.c			\
			$(SRCDIR)/ft_isdigit.c			\
			$(SRCDIR)/ft_memcpy.c			\
			$(SRCDIR)/ft_strlcat.c			\
			$(SRCDIR)/ft_strrchr.c			\
			$(SRCDIR)/ft_calloc.c			\
			$(SRCDIR)/ft_isprint.c			\
			$(SRCDIR)/ft_memmove.c			\
			$(SRCDIR)/ft_strlcpy.c			\
			$(SRCDIR)/ft_tolower.c			\
			$(SRCDIR)/ft_isalnum.c			\
			$(SRCDIR)/ft_memccpy.c			\
			$(SRCDIR)/ft_memset.c			\
			$(SRCDIR)/ft_strlen.c			\
			$(SRCDIR)/ft_toupper.c			\
			$(SRCDIR)/ft_strdup.c			\
			$(SRCDIR)/ft_substr.c			\
			$(SRCDIR)/ft_strjoin.c			\
			$(SRCDIR)/ft_strtrim.c			\
			$(SRCDIR)/ft_split.c			\
			$(SRCDIR)/ft_itoa.c				\
			$(SRCDIR)/ft_strmapi.c			\
			$(SRCDIR)/ft_putchar_fd.c		\
			$(SRCDIR)/ft_putstr_fd.c		\
			$(SRCDIR)/ft_putendl_fd.c		\
			$(SRCDIR)/ft_putnbr_fd.c
B_SRCS	=	$(SRCDIR)/ft_lstnew.c			\
			$(SRCDIR)/ft_lstadd_front.c		\
			$(SRCDIR)/ft_lstsize.c			\
			$(SRCDIR)/ft_lstlast.c			\
			$(SRCDIR)/ft_lstadd_back.c		\
			$(SRCDIR)/ft_lstdelone.c		\
			$(SRCDIR)/ft_lstclear.c			\
			$(SRCDIR)/ft_lstiter.c			\
			$(SRCDIR)/ft_lstmap.c
OBJS	=	$(SRCS:.c=.o)
B_OBJS	=	$(B_SRCS:.c=.o)
LIBC	=	ar -rcs
RM		=	rm -f
CC		=	gcc
FLAGS	=	-Wall -Werror -Wextra
INCS	=	.

ifdef WITH_BONUS
RELEVANT_OBJS = $(OBJS) $(B_OBJS)
else
RELEVANT_OBJS = $(OBJS)
endif

all:		$(NAME)

$(NAME):	$(RELEVANT_OBJS)
			${LIBC} $(NAME) $(RELEVANT_OBJS)

%.o:		%.c
			${CC} ${FLAGS} -c -I${INCS} $< -o $@

clean:
			${RM} $(OBJS) $(B_OBJS)

fclean:		clean
			${RM} $(NAME)

re:			fclean all

bonus:
			$(MAKE) WITH_BONUS=1 all

.PHONY:		all .c.o clean fclean re
