# target
DEST = build
TARGET = $(DEST)/$(ENTRY).pdf

# Latexmk commands
ENGINE = lualatex
FLAGS = -$(ENGINE) \
	-outdir=./$(DEST) \
	-synctex=1 \
	-interaction=nonstopmode \
	-file-line-error \
	-cd

# Sources
SOURCE = $(shell find \
	./src \
	./styles \
	-type f)

# Build log
BUILD_TS = $(shell date "+%Y%m%d_%H%M%S")
LOGFILE = $(DEST)/build_$(BUILD_TS).log

$(TARGET): $(SOURCE)
	mkdir -p ./$(DEST)
	latexmk $(FLAGS) ./main.tex > ./$(LOGFILE) 2>&1

clean:
	rm -f -r ./$(DEST)

format:
	find . -type f -name "*.tex" -print0 | xargs -L1 -0 latexindent -w -s -y="defaultIndent: '    '"
	find . -type f -name "*.bak0" -print0 | xargs -L1 -0 rm
	find . -type f -name "indent.log" -print0 | xargs -L1 -0 rm

all: clean $(TARGET)
