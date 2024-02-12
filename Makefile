##
## EPITECH PROJECT, 2024
## Wolfram [WSL: Ubuntu]
## File description:
## Makefile
##

NAME = wolfram
CC = stack build --stack-yaml stack.yaml
SRC_DIR = ./src/

all: $(NAME)

$(NAME):
	@$(CC)
	@echo "Compilation done"

clean:
	@stack clean
	@echo "[Delete] object files"

fclean: clean
	@echo "[Delete] $(NAME)"

re: fclean all

.PHONY: all clean fclean re
