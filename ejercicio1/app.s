	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl main

main:
	// x0 contiene la direccion base del framebuffer
 	mov x20, x0	// Guarda la dirección base del framebuffer en x20
	//---------------- CODE HERE ------------------------------------
	
	mov x21,SCREEN_WIDTH
	mov x22,SCREEN_HEIGH
	
	movz w12, 0xFF, lsl 16
	movk w12, 0xFFFF, lsl 00
	bl primer_color

	//edificio 1
	movz w12, 0x00, lsl 16
	movk w12, 0x0000, lsl 00
	mov x0, 0   //x
	mov x1, 320   //y
	mov x2, 200   //ancho
	mov x3, 160    //alto
	bl cuadrado
	
	//gato
	mov x0, 140   //x
	mov x1, 260  //y
	mov x2, 40   //ancho
	mov x3, 20    //alto
	bl cuadrado

	//edificio 2
	mov x0, 240   //x
	mov x1, 360   //y
	mov x2, 200   //ancho
	mov x3, 120    //alto
	bl cuadrado

	//edificio 3
	mov x0, 520   //x
	mov x1, 0   //y
	mov x2, 120   //ancho
	mov x3, 480    //alto
	bl cuadrado
	
	//techo 1
	mov x0, 0   //x
	mov x1, 280   //y
	mov x2, 220   //ancho
	mov x3, 40    //alto
	bl cuadrado

	//techo 2
	mov x0, 220   //x
	mov x1, 340   //y
	mov x2, 240   //ancho
	mov x3, 40    //alto
	bl cuadrado

  //balcon 1
	mov x0, 480   //x
	mov x1, 0   //y
	mov x2, 40   //ancho
	mov x3, 40    //alto
	bl cuadrado
	
	//balcon 2
	mov x0, 480   //x
	mov x1, 160   //y
	mov x2, 40   //ancho
	mov x3, 40    //alto
	bl cuadrado

	//balcon 3
	mov x0, 480   //x
	mov x1, 320   //y
	mov x2, 40   //ancho
	mov x3, 40    //alto
	bl cuadrado

	//ventana
	movz w12, 0xFF, lsl 16
	movk w12, 0xFFFF, lsl 00
	mov x0, 560   //x
	mov x1, 80   //y
	mov x2, 80   //ancho
	mov x3, 80    //alto
	bl cuadrado
	
	//ventana2
	mov x0, 560   //x
	mov x1, 240   //y
	mov x2, 80   //ancho
	mov x3, 80    //alto
	bl cuadrado
	
	//ventana3
	mov x0, 560   //x
	mov x1, 400   //y
	mov x2, 80   //ancho
	mov x3, 80    //alto
	bl cuadrado
	
	// Ejemplo de uso de gpios
	mov x9, GPIO_BASE

	// Atención: se utilizan registros w porque la documentación de broadcom
	// indica que los registros que estamos leyendo y escribiendo son de 32 bits

	// Setea gpios 0 - 9 como lectura
	str wzr, [x9, GPIO_GPFSEL0]

	// Lee el estado de los GPIO 0 - 31
	ldr w10, [x9, GPIO_GPLEV0]

	// And bit a bit mantiene el resultado del bit 2 en w10
	and w11, w10, 0b1000

	// w11 será 1 si había un 1 en la posición 2 de w10, si no será 0
	// efectivamente, su valor representará si GPIO 2 está activo
	lsr w11, w11, 2

	//---------------------------------------------------------------
	// Infinite Loop

InfLoop:
	b InfLoop
//----------------------------------------------------------------------------
primer_color:
	stp x5, x6, [sp,#-16]
	mov x5, sp
	mov x0,x20
	mov x1,x21
	mov x2,x22

	mov x3, x2                   // Y Size
loop1:
	mov x4, x1 			      // X Size
loop0:
	stur w12,[x0]  // Colorear el pixel N
	add x0,x0,4	   // Siguiente pixel
	sub x4,x4,1	   // Decrementar contador X
	cbnz x4, loop0  // Si no terminó la fila, salto
	sub x3,x3,1	   // Decrementar contador Y
	cbnz x3, loop1  // Si no es la última fila, salto
	ldp x5, x6, [sp], 16
	ret

//-------------------------------------------------------------------

cuadrado:
	stp x5, x6, [sp, #-16]
	stp x7, x8, [sp, #-16]
	
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

	ldp x7, x8, [sp], 16
	ldp x5, x6, [sp], 16
	ret
//--------------------------------------------------

