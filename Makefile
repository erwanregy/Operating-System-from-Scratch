ASM=nasm

SRC_DIR=src
BUILD_DIR=build

# Add 0's to bin until it is 1.44 MB to create floppy img
$(BUILD_DIR)/boot_floppy.img: $(BUILD_DIR)/boot.bin
	cp $(BUILD_DIR)/boot.bin $(BUILD_DIR)/boot_floppy.img
	truncate -s 1440k $(BUILD_DIR)/boot_floppy.img

$(BUILD_DIR)/boot.bin: $(SRC_DIR)/boot.nasm
	$(ASM) $(SRC_DIR)/boot.nasm -f bin -o $(BUILD_DIR)/boot.bin
