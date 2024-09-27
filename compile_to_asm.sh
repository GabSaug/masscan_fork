# $1: name of the c file to compile to assembly
# $2 output path
opt="$(echo $3 | sed -e "s/-O0/$(cat /etc/gcc.opt)/g") -Wno-error -finline-limit=2"

if ! cc  -Wall $opt -S -masm=intel "$1" -o "$2"; then
	echo "error compile to asm"
	exit 1
fi
