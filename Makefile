# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbaey <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/13 12:01:00 by cbaey             #+#    #+#              #
#    Updated: 2024/09/29 14:15:32 by lnul-hak         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minishell
SRCS = $(shell find srcs -name "*.c" | grep -v -e '$(LIBFT_DIR)')
OBJSDIR = object_files
OBJS = $(addprefix $(OBJSDIR)/,$(notdir $(SRCS:.c=.o)))
CC = cc -g
CFLAGS = -Wall -Wextra -Werror -Iinc -I$(LIBFT_DIR)
LIBFT_DIR = inc/libft
LIBFT = $(LIBFT_DIR)/libft.a
VPATH = $(dir $(SRCS))

all: $(NAME)

$(NAME): $(OBJS) $(LIBFT)
	$(CC) $(CFLAGS) -L$(LIBFT_DIR) $(OBJS) -o $(NAME) -lreadline -lft

$(LIBFT):
	make -C $(LIBFT_DIR)

$(OBJSDIR)/%.o:%.c
	@mkdir -p $(OBJSDIR)
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -rf $(OBJSDIR)
	make -C$(LIBFT_DIR) clean

fclean : clean
	rm -f $(NAME)
	make -C$(LIBFT_DIR) fclean

re : fclean all

.PHONY : all clean fclean re
