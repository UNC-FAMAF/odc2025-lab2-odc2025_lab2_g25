	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32
	.globl main

main:
 	mov x20, x0	
	mov x21,SCREEN_WIDTH
	mov x22,SCREEN_HEIGH
//-----------------------------------------------------------------------------------------------------------------------------------------
	//cielo
	movz w12, 0x00, lsl 16
	movk w12, 0x0033, lsl 00
	movz w13, 0x00, lsl 16
	movk w13, 0x0044, lsl 00
	bl fondo
//-----------------------------------------------------------------------------------------------------------------------------------------
	//luna
	movz x29, 0xFF, lsl 16
	movk x29, 0xFF66, lsl 00
	mov x0, 150   //x
	mov x1, 200   //y
	mov x2, 100   //radio
	bl circulo
//-----------------------------------------------------------------------------------------------------------------------------------------
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
//---------------------------------------------------------------------------------------------------------------------------------------
	//edificio 1-----------------------------------
	movz w12, 0x00, lsl 16
	movk w12, 0x0000, lsl 00
	mov x0, 0   
	mov x1, 320   
	mov x2, 200   
	mov x3, 160    
	bl cuadrado

	//edificio 2
	mov x0, 240   
	mov x1, 360   
	mov x2, 200   
	mov x3, 120    
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

	//techo 1
	mov x0, 0   
	mov x1, 280   
	mov x2, 220   
	mov x3, 40    
	bl cuadrado

	//techo 2
	mov x0, 220   
	mov x1, 340   
	mov x2, 240   
	mov x3, 40    
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

//---------------------------------------------------------------------------------------------------------------------------------------------------
	//ventana1-------------------------------------------
	movz w12, 0xFF, lsl 16
	movk w12, 0xCD00, lsl 00
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

//---------------------------------------------------------------------------------------------------------------------------------------------
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

//----------------------------------------------------------------------------------------------------------------------------------------------
InfLoop:
	b InfLoop
//----------------------------------------------------------------------------
fondo:
	stp x5, x6, [sp,#-16]
	mov x5, sp
	mov x0,x20
	mov x1,x21
	mov x2,x22
salto_def:
	mov x3, 40                 // Y Size
c_1_1:
	mov x4, x1 			      // X Size
c_1_0:
	stur w12,[x0]  // Colorear el pixel N
	add x0,x0,4	   // Siguiente pixel
	sub x4,x4,1	   // Decrementar contador X
	cbnz x4, c_1_0  // Si no terminó la fila, salto
	sub x3,x3,1	   // Decrementar contador Y
	cbnz x3, c_1_1  // Si no es la última fila, salto
	mov x3, 40
	mov x11, 1
salto1:
	mov x10, 2
i_1_1:
	mov x4, x21
i_1_0:
	subs x7,x11,x10
	b.ge else1
	stur w12,[x0]
	add x0,x0,4
	sub x4,x4,1
	cbnz x4, i_1_0
	sub x10,x10,1	   
	cbnz x10, i_1_1 
	sub x3,x3,2
	cbnz x3,salto1 
else1:
	stur w13,[x0]  
	add x0,x0,4	   
	sub x4,x4,1	   
	cbnz x4, i_1_0 
	sub x10,x10,1	   
	cbnz x10, i_1_1  
	sub x3,x3,2
	cbnz x3,salto1
	add w12, w12, 11
	add w13, w13, 11
	sub x2, x2, 80
	cbnz x2, salto_def

	ldp x5, x6, [sp], 16
	ret
//--------------------------------------------------------------------------------------------------------------------------------------------
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
	add x10, x20, x10  // dirección base. Sirve para dar ubicarno en el pixel de arranque

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
circulo:
	stp x3, x4, [sp, #-16]
	str x5, [sp]
	
	mov x3, x0         // x
	mov x4, x1         // y
	mov x5, x2         // radio
	mul x6, x5, x5     //radio^2

	sub x7, x3, x5       //x-radio
	add x8, x3, x5       //x+radio
	
eje_y:
	sub x9, x4, x5      //y-radio
	add x10, x4, x5     //y+radio
eje_x:
	sub x0, x3, x7
	sub x1, x4, x9
	mul x11, x0, x0
	mul x12, x1, x1
	add x13, x11, x12     //x'^2+y'^2
	
	cmp x13, x6
	b.gt saltear

	mul x0, x9, x21
	add x0, x0, x7
	lsl x0, x0, 2
	add x0,x20, x0
	stur x29,[x0]
saltear:
	add x9, x9, 1
	cmp x9, x10
	ble eje_x
	add x7,x7,1
	cmp x7,x8
	ble eje_y

	ldp x3,x4,[sp],16
	ldr x5, [sp]

	ret
//---------------------------------------------------------
