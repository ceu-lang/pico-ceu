CEU_DIR     = $(error set absolute path to "<ceu>" repository)
CEU_SDL_DIR = $(error set absolute path to "<ceu-sdl>" repository)

all:
	ceu --pre --pre-args="-I$(CEU_DIR)/include -I$(CEU_SDL_DIR)/include -DCEU_SRC=$(CEU_SRC) $(CEU_ARGS)"    \
	          --pre-input=pico.ceu                                          \
	    --ceu --ceu-err-unused=pass --ceu-err-uninitialized=pass            \
	    --env --env-types=$(CEU_DIR)/env/types.h                            \
	          --env-threads=$(CEU_DIR)/env/threads.h                        \
	          --env-main=$(CEU_DIR)/env/main.c								\
	    --cc --cc-args="-g -lm -llua5.3 -lpthread -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_net -lSDL2_gfx" \
	         --cc-output=/tmp/$$(basename $(CEU_SRC) .ceu)
	cp tiny.ttf $(dir $(CEU_SRC))
	cd $(dir $(CEU_SRC)) && /tmp/$$(basename $(CEU_SRC) .ceu)

windows:
	cp $(CEU_DIR)/env/*                           windows/pico-ceu-windows/run/ceu/env/
	cp $(CEU_DIR)/include/*                       windows/pico-ceu-windows/run/ceu/include/
	cp $(CEU_DIR)/docs/manual/v0.20/ceu-v0.20.pdf windows/pico-ceu-windows/
	cp docs/manual/v0.30/pico-ceu-v0.30.pdf       windows/pico-ceu-windows/
	cp -Rf samples/                               windows/pico-ceu-windows/
	cp /usr/local/bin/ceu                         windows/pico-ceu-windows/run/ceu.lua
	cp pico.ceu keys.ceu colors.ceu tiny.ttf      windows/pico-ceu-windows/run/ceu/
	cp $(CEU_SDL_DIR)/include/sdl/*               windows/pico-ceu-windows/run/ceu/include/sdl/

.PHONY: windows
