.globl parabola
parabola:
	sub sp, sp, 16
    str x21, [sp, 8]
    str lr, [sp]

    // x1 = parametro x de la parabola
    
    mul x21, x24, x24  
    sub x27, x27, x21 
    // -x^2 = x1 (valor final guardado en x1, formula de la parabola)

    ldr lr, [sp]
    ldr x21, [sp, 8]
    add sp, sp, 16
    ret

.globl cuadrado 
cuadrado:
    sub sp, sp, #48         // Reservar 32 bytes (16 + 16)
    stp x5, x6, [sp, #0]    // Guardar x5 y x6
    stp x7, x8, [sp, #16]   // Guardar x7 y x8
    str lr, [sp, 32]

	
	mov x5, x0   // x
	mov x6, x1   // y
	mov x7, x2   // ancho
	mov x8, x3   // alto

	mov x4, x8   // altura
	filas:
	mov x9, x7   // ancho
	mul x10, x6, x21   // y * ancho
	add x10, x10, x5   // + x
	lsl x10, x10, 2    // *4
	add x10, x20, x10  // dirección base

	columnas:
	stur w12, [x10]
	add x10, x10, 4
	sub x9, x9, 1
	cbnz x9, columnas

	add x6, x6, 1
	sub x4, x4, 1
	cbnz x4, filas

	ldr lr, [sp, 32]
    ldp x7, x8, [sp, #16]
    ldp x5, x6, [sp, #0]
    add sp, sp, #48
	ret

.globl delay
    delay:
    mov x11, 0x1111
    loopdelay:
    mov x12, x11
    sub x11, x11, 1
    loopotro:
    sub x12, x12, 1
    cbnz x12, loopotro
    cbnz x11, loopdelay

    ret
