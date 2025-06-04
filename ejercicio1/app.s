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
//cielo--------------------------------------------------------------
	movz w12, 0x00, lsl 16
	movk w12, 0x0100, lsl 00
	bl fondo 
	//estrellas
	movz w12,0xff, lsl 16
	movk w12,0xffff , lsl 00
	mov x0, 516  //x
	mov x1, 15    //y
	estrella:
	mov x2, 3   //ancho
	mov x3, 3    //alto
	bl cuadrado
	sub x0,x0,42
	cmp x0, 0
	b.gt estrella
	add x0,x0,518
	add x1, x1, 16
	cmp x1, 480
	b.lt estrella
//luna--------------------------------------------------
    movz w12, 0xFF, lsl 16
    movk w12, 0xFF66, lsl 00
    mov x0, 300
    mov x1, 240
	mov x2, 90
	mov x3, 100
	bl cuadrado
	mov x0, 280
    mov x1, 260
	mov x2, 30
	mov x3, 80
	bl cuadrado
	mov x0, 260
    mov x1, 280
	mov x2, 30
	mov x3, 80
	bl cuadrado
	mov x0, 380
    mov x1, 260
	mov x2, 30
	mov x3, 80
	bl cuadrado
	mov x0, 400
    mov x1, 280
	mov x2, 30
	mov x3, 80
	bl cuadrado
//nubes-------------------------------------------------------------
	//nube1
	movz w12, 0x66, lsl 16
	movk w12, 0x66CC, lsl 00
	mov x0, 0  //x
	mov x1, 60   //y
	mov x2, 200   //ancho
	mov x3, 40    //alto
	bl cuadrado
	mov x0, 40  
	mov x1, 40   
	mov x2, 100   
	mov x3, 40    
	bl cuadrado
	mov x0, 120  
	mov x1, 100   
	mov x2, 60   
	mov x3, 10    
	bl cuadrado
	movz w12, 0x90, lsl 16
	movk w12, 0x90E1, lsl 00
	mov x0, 0  //x
	mov x1, 90   //y
	mov x2, 110   //ancho
	mov x3, 3    //alto
	bl cuadrado
	mov x0, 125  
	mov x1, 100   
	mov x2, 50   
	mov x3, 3   
	bl cuadrado

	//nube2
	movz w12, 0x66, lsl 16
	movk w12, 0x66CC, lsl 00
	mov x0, 300  
	mov x1, 160   
	mov x2, 200   
	mov x3, 40    
	bl cuadrado
	mov x0, 400  
	mov x1, 120   
	mov x2, 100   
	mov x3, 40    
	bl cuadrado
	movz w12, 0x90, lsl 16
	movk w12, 0x90E1, lsl 00
	mov x0, 305  
	mov x1, 165   
	mov x2, 5   
	mov x3, 30
	bl cuadrado
	mov x0, 310  
	mov x1, 193   
	mov x2, 140
	mov x3, 3   
	bl cuadrado
//edificios---------------------------------------------------------------------------------------------------------------------------------------
	//edificio 1
	movz w12, 0x00, lsl 16
	movk w12, 0x0000, lsl 00
	mov x0, 0
	mov x1, 320
	mov x2, 200
	mov x3, 160
	bl cuadrado
	//techo
	mov x0, 0
	mov x1, 280
	mov x2, 220
	mov x3, 40
	bl cuadrado

	//edificio 2
	mov x0, 240 
	mov x1, 360   
	mov x2, 200   
	mov x3, 120    
	bl cuadrado
	//techo 2
	mov x0, 220
	mov x1, 340
	mov x2, 240
	mov x3, 40
	bl cuadrado
	
	//edificio 3
	mov x0, 520
	mov x1, 0
	mov x2, 120
	mov x3, 480
	bl cuadrado
  	//balcon 1
	mov x0, 480
	mov x1, 0
	mov x2, 40
	mov x3, 40
	bl cuadrado
	//balcon 2
	mov x0, 480
	mov x1, 160
	mov x2, 40
	mov x3, 40
	bl cuadrado
	mov x0, 480   
	mov x1, 151   
	mov x2, 3   
	mov x3, 9    
	bl cuadrado
	mov x0, 480   
	mov x1, 151   
	mov x2, 40   
	mov x3, 5    
	bl cuadrado
	//balcon 3
	mov x0, 480
	mov x1, 320
	mov x2, 40
	mov x3, 40
	bl cuadrado
	mov x0, 480   
	mov x1, 311   
	mov x2, 3   
	mov x3, 9    
	bl cuadrado
	mov x0, 480   
	mov x1, 311   
	mov x2, 40   
	mov x3, 5    
	bl cuadrado
	//ventana1
	movz w12, 0xEC, lsl 16
	movk w12, 0xC457, lsl 00
	mov x0, 560
	mov x1, 80
	mov x2, 80
	mov x3, 80
	bl cuadrado
	//ventana2
	mov x0, 560
	mov x1, 240
	mov x2, 80
	mov x3, 80
	bl cuadrado
	//ventana3
	mov x0, 560
	mov x1, 400
	mov x2, 80
	mov x3, 80
	bl cuadrado
	//marco de ventanas
	movz w12, 0x00, lsl 16
	movk w12, 0x0000, lsl 00
	mov x0, 620
	mov x1, 80
	mov x2, 5
	mov x3, 80
	bl cuadrado
	mov x0, 620
	mov x1, 240
	mov x2, 5
	mov x3, 80
	bl cuadrado
	mov x0, 620
	mov x1, 400
	mov x2, 5
	mov x3, 80
	bl cuadrado
	//reflejo de luz de las ventanas
	movz w12, 0x66, lsl 16
	movk w12, 0x6600, lsl 00
	mov x0, 550
	mov x1, 165
	mov x2, 90
	mov x3, 3
	bl cuadrado
	mov x0, 550
	mov x1, 325
	mov x2, 90
	mov x3, 3
	bl cuadrado

	//reflejo de la luz de la luna
	movz w12, 0x2C, lsl 16
	movk w12, 0x2C41, lsl 00
	mov x0, 0   
	mov x1, 285   
	mov x2, 135   
	mov x3, 3    
	bl cuadrado
	mov x0, 185   
	mov x1, 285  
	mov x2, 30   
	mov x3, 3
	bl cuadrado
	mov x0, 225   
	mov x1, 345   
	mov x2, 230   
	mov x3, 3    
	bl cuadrado
//cartel----------------------------------------------------
	movz w12, 0x00, lsl 16
	movk w12, 0x1933, lsl 00
	mov x0, 0    
	mov x1, 345   
	mov x2, 195   
	mov x3, 120    
	bl cuadrado
	movz w12, 0x22, lsl 16
	movk w12, 0x66AB, lsl 00
	mov x0, 0    
	mov x1, 350   
	mov x2, 190   
	mov x3, 110    
	bl cuadrado

	//Odc2025--------------------------------------------------
	movz w12, 0x22, lsl 16
	movk w12, 0xB9FF, lsl 00
	mov x0, 5    
	mov x1, 360   
	mov x2, 30   
	mov x3, 40    
	bl cuadrado

	mov x0, 40   
	mov x1, 360   
	mov x2, 20   
	mov x3, 40    
	bl cuadrado
    
	mov x0, 65   
	mov x1, 360   
	mov x2, 30   
	mov x3, 40    
	bl cuadrado

	mov x0, 5    
	mov x1, 410   
	mov x2, 30   
	mov x3, 40    
	bl cuadrado

	mov x0, 40   
	mov x1, 410   
	mov x2, 30   
	mov x3, 40    
	bl cuadrado

	mov x0, 75   
	mov x1, 410   
	mov x2, 30   
	mov x3, 40    
	bl cuadrado

	mov x0, 110  
	mov x1, 410   
	mov x2, 30   
	mov x3, 40 
	bl cuadrado

	movz w12, 0x22, lsl 16
	movk w12, 0x66AB, lsl 00
	mov x0, 10
	mov x1, 365
	mov x2, 20
	mov x3, 30
	bl cuadrado

	mov x0, 40
	mov x1, 360
	mov x2, 15
	mov x3, 20
	bl cuadrado

	mov x0, 45
	mov x1, 385
	mov x2, 10
	mov x3, 10
	bl cuadrado

	mov x0, 70
	mov x1, 365
	mov x2, 25
	mov x3, 30
	bl cuadrado

	mov x0, 5    
	mov x1, 415   
	mov x2, 25   
	mov x3, 12    
	bl cuadrado

	mov x0, 10    
	mov x1, 433   
	mov x2, 25   
	mov x3, 12    
	bl cuadrado

	mov x0, 45   
	mov x1, 415 
	mov x2, 20
	mov x3, 30
	bl cuadrado

	mov x0, 75   
	mov x1, 415  
	mov x2, 25   
	mov x3, 12    
	bl cuadrado

	mov x0, 80    
	mov x1, 433   
	mov x2, 25   
	mov x3, 12    
	bl cuadrado

	mov x0, 115   
	mov x1, 415  
	mov x2, 25   
	mov x3, 12    
	bl cuadrado

	mov x0, 110  
	mov x1, 433   
	mov x2, 25   
	mov x3, 12    
	bl cuadrado
//gato------------------------------------------------------------------------------------------------------------
	//cuerpo
	movz w12, 0x00, lsl 16
	movk w12, 0x0000, lsl 00
	mov x0, 140   
	mov x1, 260  
	mov x2, 40   
	mov x3, 20    
	bl cuadrado
	
	//cola
	mov x0, 130   
	mov x1, 270  
	mov x2, 10   
	mov x3, 5    
	bl cuadrado
	mov x0, 130   
	mov x1, 260  
	mov x2, 5   
	mov x3, 10    
	bl cuadrado

	//cabeza
	mov x0, 160   
	mov x1, 240  
	mov x2, 20   
	mov x3, 20    
	bl cuadrado

	//orejas
	mov x0, 160   
	mov x1, 230  
	mov x2, 3   
	mov x3, 10    
	bl cuadrado
	mov x0, 162   
	mov x1, 235  
	mov x2, 3   
	mov x3, 5    
	bl cuadrado
	mov x0, 174   
	mov x1, 235  
	mov x2, 3   
	mov x3, 5    
	bl cuadrado
	mov x0, 177   
	mov x1, 230  
	mov x2, 3   
	mov x3, 10    
	bl cuadrado
	
	//ojos
	movz w12, 0x00, lsl 16
	movk w12, 0xCC66, lsl 00
	mov x0, 164   
	mov x1, 250  
	mov x2, 5   
	mov x3, 5    
	bl cuadrado
	mov x0, 174   
	mov x1, 250  
	mov x2, 5   
	mov x3, 5    
	bl cuadrado

	//collar
	movz w12, 0xFF, lsl 16
	movk w12, 0x0000, lsl 00
	mov x0, 160   
	mov x1, 257  
	mov x2, 20   
	mov x3, 5    
	bl cuadrado

	//---------------------------------------------------------------
	// Infinite Loop
InfLoop:
	b InfLoop
//funciones----------------------------------------------------------------------------
	fondo:
	stp x5, x6, [sp,#16]
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
	 sub w15, w12, 0x0001ff
	 cbnz w15, color

	cbnz x3, loop1  // Si no es la última fila, salto
	ldp x5, x6, [sp], 16
	ret

	color:
	add w12,w12,1
	b loop1
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

