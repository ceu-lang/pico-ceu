include Makefile.dirs

SERIAL ?= false
POSIX  ?= true

ifeq ($(SERIAL), true)
	D_SERIAL = -DPICOCEU_SERIAL
endif
ifeq ($(POSIX), true)
	D_POSIX = -D_POSIX
endif

all:
	ceu --pre --pre-args="-I$(CEU_DIR)/include -I$(CEU_SDL_DIR)/include -I./include $(D_SERIAL) $(D_POSIX) -DCEUMAKER_PICO -DCEU_SRC=$(CEU_SRC) $(CEU_ARGS)"    \
	          --pre-input=pico.ceu                                          \
	    --ceu --ceu-err-unused=pass --ceu-err-uninitialized=pass --ceu-line-directives=false			\
	          --ceu-features-trace=true --ceu-features-exception=true          \
	          --ceu-features-dynamic=true \
	          --ceu-features-pool=true \
	          --ceu-features-pause=true \
	    --env --env-types=$(CEU_DIR)/env/types.h                            \
	          --env-threads=$(CEU_DIR)/env/threads.h                        \
	          --env-main=$(CEU_DIR)/env/main.c								\
	          --env-output=/tmp/_ceu.c \
	    --cc --cc-args="-g -lm -llua5.3 -lpthread -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_net -lSDL2_gfx" \
	         --cc-output=/tmp/$$(basename $(CEU_SRC) .ceu)
	mkdir -p $(dir $(CEU_SRC))/res/
	cp tiny.ttf $(dir $(CEU_SRC))/res/
	cd $(dir $(CEU_SRC)) && /tmp/$$(basename $(CEU_SRC) .ceu)
