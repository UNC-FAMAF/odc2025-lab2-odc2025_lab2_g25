	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32
	.globl main

main:
	// x0 contiene la direccion base del framebuffer
 	mov x20, x0	// Guarda la dirección base del framebuffer en x20
	//----------------codigos------------------------------------
	mov x21,SCREEN_WIDTH
	mov x22,SCREEN_HEIGH

buclecin: 

	mov x26, 0
	mov x27, 0
	mov x25, 30
ciclo :  //Se acerca a la orilla
	bl fondo
	bl gato 
	bl delay
	add x26, x26, 1
	sub x25, x25, 1
	cbnz x25, ciclo

	mov x24, -5
	mov x25, 10
ciclo2 : //Salta
	bl fondo
	bl gato 
	bl delay
	add x26, x26, 5
	bl parabola
	add x24, x24, 1
	sub x25, x25, 1
	cbnz x25, ciclo2

	mov x25, 50
ciclo3 : //Baja
	bl fondo
	bl gato 
	bl delay
	add x26, x26, 2
	add x27, x27, 3
	sub x25, x25, 1
	cbnz x25, ciclo3

	mov x25, 50
ciclo4 : //Se acerca a la otra orilla
	bl fondo
	bl gato 
	bl delay
	add x26, x26, 2
	sub x25, x25, 1
	cbnz x25, ciclo4

	mov x24, -5
	mov x25, 10
ciclo5 : //Salta
	bl fondo
	bl gato 
	bl delay
	add x26, x26, 5
	bl parabola
	add x24, x24, 1
	sub x25, x25, 1
	cbnz x25, ciclo5

	mov x25, 23
ciclo6 : //Cae en el balcon
	bl fondo
	bl gato 
	bl delay
	add x26, x26, 2
	add x27, x27, 3
	sub x25, x25, 1
	cbnz x25, ciclo6

	mov x25, 50
ciclo7 : //Se va
	bl fondo
	bl gato 
	bl delay
	add x26, x26, 2
	sub x25, x25, 1
	cbnz x25, ciclo7

	mov x24, -5
	mov x25, 10
ciclo8 : //Salta
	bl fondo
	bl gato 
	bl delay
	add x26, x26, 5
	bl parabola
	add x24, x24, 1
	sub x25, x25, 1
	cbnz x25, ciclo8

	mov x25, 12
ciclo9 : //Cae en el techo
	bl fondo
	bl gato 
	bl delay
	add x26, x26, 2
	add x27, x27, 3
	sub x25, x25, 1
	cbnz x25, ciclo9

	mov x25, 45
ciclo10 : //Se pone en loop
	bl fondo
	bl gato 
	bl delay
	add x26, x26, 2
	sub x25, x25, 1
	cbnz x25, ciclo10

    b buclecin
	//---------------------------------------------------------------
	// Infinite Loop
InfLoop:
	b InfLoop



//--------------------------------------------------

