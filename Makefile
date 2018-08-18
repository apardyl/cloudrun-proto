gendir := gen
PROTOSOURCES := $(shell find . -type f -name "*.proto")
PROTOPYFILES := $(PROTOSOURCES:./%.proto=$(gendir)/%.pb.py)
PROTOC := protoc

all: $(PROTOPYFILES)

$(gendir)/%.pb.py: %.proto
	@echo Generating proto $@
	@mkdir -p "$(@D)"
	$(PROTOC) $< -I $(<D) --python_out=$(@D)
