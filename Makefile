#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gemartin <gemartin@student.42barc...>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/15 18:21:24 by gemartin          #+#    #+#              #

#                                                                              #
#******************************************************************************#

NAME = libft.a

DEL_LINE =		\033[2K
ITALIC =		\033[3m
BOLD =			\033[1m
DEF_COLOR =		\033[0;39m
GRAY =			\033[0;90m
RED =			\033[0;91m
GREEN =			\033[0;92m
YELLOW =		\033[0;93m
BLUE =			\033[0;94m
MAGENTA =		\033[0;95m
CYAN =			\033[0;96m
WHITE =			\033[0;97m
BLACK =			\033[0;99m
ORANGE =		\033[38;5;209m
BROWN =			\033[38;2;184;143;29m
DARK_GRAY =		\033[38;5;234m
MID_GRAY =		\033[38;5;245m
DARK_GREEN =	\033[38;2;75;179;82m
DARK_YELLOW =	\033[38;5;143m

SRCS = ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c \
				ft_toupper.c ft_tolower.c ft_strncmp.c ft_memcmp.c \
				ft_strlen.c ft_strlcat.c ft_strlcpy.c ft_strchr.c ft_atoi.c \
				ft_strrchr.c ft_strnstr.c ft_memset.c ft_memcpy.c ft_memmove.c \
				ft_bzero.c ft_memchr.c ft_calloc.c ft_strdup.c ft_strjoin.c \
				ft_strtrim.c ft_substr.c ft_split.c  ft_putchar_fd.c \
				ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_strmapi.c \
				ft_striteri.c ft_itoa.c ft_lstnew.c
BONUS = ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c \
				ft_lstadd_back.c ft_lstdelone.c ft_lstclear.c ft_lstiter.c \
				ft_lstmap.c

INCLUDE = libft.h

CC = gcc
RM = rm -f
CFLAGS = -Wall -Wextra -Werror

%.o: %.c ${INCLUDE}
			@echo "${BLUE} ◎ $(BROWN)Compiling   ${MAGENTA}→   $(CYAN)$< $(DEF_COLOR)"
			@${CC} ${CFLAGS} -c $< -o $@

OBJS = ${SRCS:.c=.o}
BONUS_OBJECTS = ${BONUS:.c=.o}

${NAME}: ${OBJS} $(INCLUDE)
				@ar -rsc ${NAME} ${OBJS}
				@echo "\n$(GREEN) Created $(NAME) ✓ $(DEF_COLOR)\n"

bonus: ${OBJS} ${BONUS_OBJECTS} $(INCLUDE)
				@ar -rsc $(NAME) $^
				@touch $@
				@echo "\n${GREEN} Bonus compiled successfully ✓ $(DEF_COLOR)\n"

all:	${NAME}

clean:
			@${RM} ${OBJS} ${BONUS_OBJECTS}
			@echo "\n${BLUE} ◎ $(RED)All objects cleaned successfully ${BLUE}◎$(DEF_COLOR)\n"

fclean:
			@${RM} ${OBJS} ${BONUS_OBJECTS}
			@${RM} ${NAME}
			@${RM} bonus
			@echo "\n${BLUE} ◎ $(RED)All objects and executable cleaned successfully${BLUE} ◎$(DEF_COLOR)\n"

re: fclean all

.PHONY: all clean fclean re
