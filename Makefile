CEU_DIR     = $(error set absolute path to "<ceu>" repository)
CEU_SDL_DIR = $(error set absolute path to "<ceu-sdl>" repository)

all:
	ceu --pre --pre-args="-I$(CEU_DIR)/include -I$(CEU_SDL_DIR)/include -I./include -DCEU_SRC=$(CEU_SRC) $(CEU_ARGS)"    \
	          --pre-input=pico.ceu                                          \
	    --ceu --ceu-err-unused=pass --ceu-err-uninitialized=pass --ceu-line-directives=true			\
	    --env --env-types=$(CEU_DIR)/env/types.h                            \
	          --env-threads=$(CEU_DIR)/env/threads.h                        \
	          --env-main=$(CEU_DIR)/env/main.c								\
	    --cc --cc-args="-g -lm -llua5.3 -lpthread -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_net -lSDL2_gfx" \
	         --cc-output=/tmp/$$(basename $(CEU_SRC) .ceu)
	mkdir -p $(dir $(CEU_SRC))/res/
	cp tiny.ttf $(dir $(CEU_SRC))/res/
	cd $(dir $(CEU_SRC)) && /tmp/$$(basename $(CEU_SRC) .ceu)
