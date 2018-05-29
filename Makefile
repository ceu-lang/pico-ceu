include Makefile.dirs

SERIAL ?= false
POSIX  ?= true

ifeq ($(SERIAL), true)
	D_SERIAL = -DPICOCEU_SERIAL
endif
ifeq ($(POSIX), true)
	D_POSIX = -D_POSIX
endif

ifdef CEU_SRC
CEU_SRC_ = $(CEU_SRC)
ifneq ("$(wildcard $(CEU_SRC)/main.ceu)","")
	CEU_SRC_ = $(CEU_SRC)/main.ceu
endif
else
$(error missing `CEU_SRC` path to compile)
endif

all:
	ceu --pre --pre-args="-I$(CEU_DIR)/include -I$(CEU_SDL_DIR)/include -I./include $(D_SERIAL) $(D_POSIX) -DCEUMAKER_PICO -DCEU_SRC=$(CEU_SRC_) $(CEU_ARGS)"    \
	          --pre-input=pico.ceu                                          \
	    --ceu --ceu-err-unused=pass --ceu-err-uninitialized=pass --ceu-line-directives=false			\
	          --ceu-features-trace=true --ceu-features-exception=true          \
	          --ceu-features-dynamic=true \
	          --ceu-features-pool=true \
	          --ceu-features-pause=true \
	          --ceu-features-os=true \
	          --ceu-features-async=true \
	    --env --env-types=$(CEU_DIR)/env/types.h                            \
	          --env-threads=$(CEU_DIR)/env/threads.h                        \
	          --env-main=$(CEU_DIR)/env/main.c								\
	          --env-output=/tmp/_ceu.c \
	    --cc --cc-args="-g -lm -llua5.3 -lpthread -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_net -lSDL2_gfx" \
	         --cc-output=/tmp/$$(basename $(CEU_SRC_) .ceu)
	cp tiny.ttf $(dir $(CEU_SRC_))/
	cd $(dir $(CEU_SRC_)) && /tmp/$$(basename $(CEU_SRC_) .ceu)
