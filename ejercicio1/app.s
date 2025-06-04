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
	
	movz w12, 0x00, lsl 16
	movk w12, 0x0100, lsl 00
	bl fondo   // 000000000000000011111111

	// movz w12, 0xff, lsl 16
	// movk w12, 0x9933, lsl 00
	// bl fondo

	movz w12, 0xff, lsl 16
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
	

	   // Color del semicírculo (rojo: 0xFFFF0000)
    movz w12, 0xff, lsl 16    // Componente rojo
    movk w12, 0x8000, lsl 00      // Alpha
    
    // Parámetros del semicírculo
    //mov x3, 100                 // Radio del semicírculo
    mov x0, (SCREEN_WIDTH/2)-20      // Centro X (320)
    mov x1, (SCREEN_HEIGH/2)      // Centro Y (240)
	mov x2, 90
	mov x3, 100
	bl cuadrado

	mov x0, (SCREEN_WIDTH/2)-40      // Centro X (320)
    mov x1, (SCREEN_HEIGH/2)+20      // Centro Y (240)
	mov x2, 30
	mov x3, 80
	bl cuadrado
	mov x0, (SCREEN_WIDTH/2)-60      // Centro X (320)
    mov x1, (SCREEN_HEIGH/2)+40      // Centro Y (240)
	mov x2, 30
	mov x3, 80
	bl cuadrado
		mov x0, (SCREEN_WIDTH/2)+60      // Centro X (320)
    mov x1, (SCREEN_HEIGH/2)+20      // Centro Y (240)
	mov x2, 30
	mov x3, 80
	bl cuadrado
	mov x0, (SCREEN_WIDTH/2)+80      // Centro X (320)
    mov x1, (SCREEN_HEIGH/2)+40      // Centro Y (240)
	mov x2, 30
	mov x3, 80
	bl cuadrado
	

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
	
	//nube2
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
	mov x0, 400  
	mov x1, 120   
	mov x2, 100   
	mov x3, 40    
	bl cuadrado
//---------------------------------------------------------------------------------------------------------------------------------------
	//edificio 1-----------------------------------
	movz w12, 0x00, lsl 16
	movk w12, 0x0000, lsl 00
	mov x0, 0   //x
	mov x1, 320   //y
	mov x2, 200   //ancho
	mov x3, 160    //alto
	bl cuadrado
	
//gato------------------------------------------------------------------------------------------------------------
	//cuerpo----------------------------------------
	movz w12, 0x00, lsl 16
	movk w12, 0x0000, lsl 00
	mov x0, 140   
	mov x1, 260  
	mov x2, 40   
	mov x3, 20    
	bl cuadrado
	
	//cola-------------------------------------------
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

	//cabeza-----------------------------------------
	mov x0, 160   
	mov x1, 240  
	mov x2, 20   
	mov x3, 20    
	bl cuadrado

	//orejas-----------------------------------------
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
	
	//ojos--------------------------------------------
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
	//edificio 2
		movz w12, 0x00, lsl 16
	movk w12, 0x0000, lsl 00
	mov x0, 240 
	mov x1, 360   
	mov x2, 200   
	mov x3, 120    
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
	movz w12, 0xec, lsl 16
	movk w12, 0xc457, lsl 00
	mov x0, 560   //x
	mov x1, 80   //y
	mov x2, 80   //ancho
	mov x3, 80    //alto
	bl cuadrado
	
	//ventana2------------------------------------------
	mov x0, 560   //x
	mov x1, 240   //y
	mov x2, 80   //ancho
	mov x3, 80    //alto
	bl cuadrado
	
	//ventana3-----------------------------------------
	mov x0, 560   //x
	mov x1, 400   //y
	mov x2, 80   //ancho
	mov x3, 80    //alto
	bl cuadrado

//cartel----------------------------------------------------
	movz w12, 0x33, lsl 16
	movk w12, 0x99FF, lsl 00
	mov x0, 0    
	mov x1, 350   
	mov x2, 190   
	mov x3, 110    
	bl cuadrado

	//Odc2025--------------------------------------------------
	movz w12, 0x00, lsl 16
	movk w12, 0x0000, lsl 00
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

	movz w12, 0x33, lsl 16
	movk w12, 0x99FF, lsl 00
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


		// //cuerpo
	//movz w12, 0x00, lsl 16
	// movk w12, 0x0000, lsl 00
	// mov x0, 100   //x
	// mov x1, 200   //y
	// mov x2, 380   //ancho
	// mov x3, 240    //alto
	// bl cuadrado
    


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

//-------------------------------------------------------------------
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
