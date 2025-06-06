.globl gato
gato:
// x26 pone las coordenadas donde queres el gato 
//gato------------------------------------------------------------------------------------------------------------
	//cuerpo
    mov x29, x30
	movz w12, 0x0000, lsl 16
	movk w12, 0x0000, lsl 00
	add x0, x26 ,140   
	add x1, x27, 260  
	mov x2, 40   
	mov x3, 20    
	bl cuadrado
	
	//cola
	add x0, x26,130   
	add x1,x27, 270  
	mov x2, 10   
	mov x3, 5    
	bl cuadrado
	add x0,x26, 130   
	add x1,x27, 260  
	mov x2, 5   
	mov x3, 10    
	bl cuadrado

	//cabeza
	add x0,x26, 160   
	add x1,x27, 240  
	mov x2, 20   
	mov x3, 20    
	bl cuadrado

	//orejas
	add x0,x26, 160   
	add x1,x27, 230  
	mov x2, 3   
	mov x3, 10    
	bl cuadrado
	add x0,x26, 162   
	add x1,x27, 235  
	mov x2, 3   
	mov x3, 5    
	bl cuadrado
	add x0,x26, 174   
	add x1,x27, 235  
	mov x2, 3   
	mov x3, 5    
	bl cuadrado
	add x0,x26, 177   
	add x1,x27, 230  
	mov x2, 3   
	mov x3, 10    
	bl cuadrado
	
	//ojos
	movz w12, 0x0000, lsl 16
	movk w12, 0xCC66, lsl 00
	add x0,x26, 164   
	add x1,x27, 250  
	mov x2, 5   
	mov x3, 5    
	bl cuadrado
	add x0,x26, 174   
	add x1,x27, 250  
	mov x2, 5   
	mov x3, 5    
	bl cuadrado

	//collar
	movz w12, 0x00FF, lsl 16
	movk w12, 0x0000, lsl 00
	add x0, x26, 160   
	add x1, x27, 257  
	mov x2, 20   
	mov x3, 5    
	bl cuadrado
    mov x30, x29
    ret
