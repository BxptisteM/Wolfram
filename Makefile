##
## EPITECH PROJECT, 2024
## Wolfram [WSL: Ubuntu]
## File description:
## Makefile
##

NAME = wolfram
CC = stack
SRC_DIR = ./src/

BINARY_PATH = `stack path --local-install-root`/bin/$(NAME)-exe

all: $(NAME)

$(NAME):
	@$(CC) build
	@cp $(BINARY_PATH) ./$(NAME)
	@echo "Compilation done"

clean:
	@stack clean
	@echo "[Delete] object files"

fclean: clean
	@rm -f $(NAME)
	@echo "[Delete] $(NAME)"

re: fclean all

.PHONY: all clean fclean re
