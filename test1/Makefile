led_on.bin: start.s
	# arm-none-eabi-gcc -g -c -o led_on.o led_on.S
	arm-none-eabi-gcc -c start.s -o led.o
	arm-none-eabi-ld led.o -Ttext 0x08000000 -o led_on.elf
	arm-none-eabi-objcopy led_on.elf -O binary -S led_on.bin
clean:
	rm -f led_on.bin led_on.elf *.o

all: led_on.bin

flash: all
	openocd -f interface/cmsis-dap.cfg -f target/stm32f1x.cfg  -c "program led_on.bin 0x08000000 verify reset exit"
# flash: all
# 	openocd -f interface/cmsis-dap.cfg -f target/stm32f1x.cfg  -c "program $(BUILD_DIR)/$(TARGET).elf verify reset exit"
