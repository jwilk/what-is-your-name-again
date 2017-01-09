rst_files = $(wildcard *.rst)
stamp_files = $(rst_files:.rst=.stamp)

rst_options = --input-encoding=UTF-8 --output-encoding=UTF-8 --strict

.PHONY: check
check: $(stamp_files)

%.stamp: %.rst
	rst2xml $(rst_options) $(<) > /dev/null
	touch $(@)

.PHONY: clean
clean:
	rm -f *.stamp

# vim:ts=4 sts=4 sw=4 noet
