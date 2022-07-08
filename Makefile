#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gemartin <gemartin@student.42barc...>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/15 18:21:24 by gemartin          #+#    #+#              #
#    Updated: 2022/01/27 00:59:57 by gemartin         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME = libft.a

GREEN := \033[0;92m

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

.c.o:
			${CC} ${CFLAGS} -c $< -o ${<:.c=.o}

OBJS = ${SRCS:.c=.o}
BONUS_OBJECTS = ${BONUS:.c=.o}

${NAME}: ${OBJS} $(INCLUDE)
				@ar -rsc $@ $^
				@echo "$(GREEN)Libft compiled successfully.$(DEF_COLOR)"

bonus: ${OBJS} ${BONUS_OBJECTS} $(INCLUDE)
				@ar -rsc $(NAME) $^
				@touch $@
				@echo "$(GREEN)Libft bonus compiled successfully.$(DEF_COLOR)"

all:	${NAME}

clean:
			${RM} ${OBJS} ${BONUS_OBJECTS}
			@echo "$(GREEN)Objects cleaned successfully.$(DEF_COLOR)"

fclean:
			${RM} ${OBJS} ${BONUS_OBJECTS}
			${RM} ${NAME}
			${RM} bonus
			@echo "$(GREEN)Objects and executable cleaned successfully.$(DEF_COLOR)"

re: fclean all
	@echo "$(GREEN)Cleaned and recompiled libft.$(DEF_COLOR)"

.PHONY: all clean fclean re
