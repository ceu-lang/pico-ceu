CEU_DIR     = $(error set absolute path to "<ceu>" repository)
CEU_SDL_DIR = $(error set absolute path to "<ceu-sdl>" repository)

all:
	ceu --pre --pre-args="-I$(CEU_DIR)/include -I$(CEU_SDL_DIR)/include -I. -DCEU_SRC=main.ceu"    \
	          --pre-input=../../pico.ceu                                    \
	    --ceu --ceu-err-unused=pass --ceu-err-uninitialized=pass            \
	    --env --env-types=$(CEU_DIR)/env/types.h                            \
	          --env-threads=$(CEU_DIR)/env/threads.h                        \
	          --env-main=$(CEU_DIR)/env/main.c --env-output=/tmp/storm.c    \
	    --cc --cc-args="-lm -llua5.3 -lpthread -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_net -lSDL2_gfx" \
	         --cc-output=storm
	./storm
