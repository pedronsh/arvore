jmp inicio
posCesto: var #1		; Contem a posicao atual do cesto
posAntCesto: var #1		; Contem a posicao anterior do cesto
scoretable: var #1		; Contem o score atual
posMaca: var #1			; Contem a posicao atual da maçã 
posAntMaca: var #1		; Contem a posicao anterior da maçã
posPombo: var #1		; Contem a posição do Pombo
posAntPombo: var #1		; Contem a posição anterior do Pombo
posMerdaPombo: var #1	; Contem a posição da merda do Pombo
posAntMerdaPombo: var #1; Contem a posição anterior da merda do Pombo
IncRand1: var #1		; Lista de valores aleatórios para  posição da maçã
score: var #1
highscore: var #1
Rand: var #30
	static Rand + #0, #730
	static Rand + #1, #740
	static Rand + #2, #780
	static Rand + #3, #645
	static Rand + #4, #619
	static Rand + #5, #548
	static Rand + #6, #463
	static Rand + #7, #542
	static Rand + #8, #708
	static Rand + #9, #551
	static Rand + #10, #697
	static Rand + #11, #490
	static Rand + #12, #385
	static Rand + #13, #890
	static Rand + #14, #696
	static Rand + #15, #573
	static Rand + #16, #792
	static Rand + #17, #900
	static Rand + #18, #708
	static Rand + #19, #343
	static Rand + #20, #714
	static Rand + #20, #669
	static Rand + #21, #684
	static Rand + #22, #713
	static Rand + #23, #796
	static Rand + #24, #665
	static Rand + #25, #544
	static Rand + #26, #670
	static Rand + #27, #494
	static Rand + #28, #833
	static Rand + #29, #512


IncRand: var #1			;Lista de valores aleatórios para  posição da maçã 2
Rand1 : var #30			
	static Rand1 + #0, #730
	static Rand1 + #1, #740
	static Rand1 + #2, #745
	static Rand1 + #3, #780
	static Rand1 + #4, #900
	static Rand1 + #5, #970
	static Rand1 + #6, #412
	static Rand1 + #7, #684
	static Rand1 + #8, #374
	static Rand1 + #9, #544
	static Rand1 + #10, #630
	static Rand1 + #11, #708
	static Rand1 + #12, #900
	static Rand1 + #13, #670
	static Rand1 + #14, #886
	static Rand1 + #15, #506
	static Rand1 + #16, #724
	static Rand1 + #17, #882
	static Rand1 + #18, #490
	static Rand1 + #19, #512
	static Rand1 + #20, #667
	static Rand1 + #20, #530
	static Rand1 + #21, #834
	static Rand1 + #22, #530
	static Rand1 + #23, #667
	static Rand1 + #24, #489
	static Rand1 + #25, #686
	static Rand1 + #26, #511
	static Rand1 + #27, #915
	static Rand1 + #28, #470
	static Rand1 + #29, #387

inicio:
	loadn r1, #0
	store highscore, r1
	call ApagaTela  
	loadn R1, #tela5Linha0	 ; Endereco onde comeca a primeira linha da tela inicial
	loadn R2, #0              ; Carrega cor branca
	call ImprimeTela		 ; Rotina de Impressao da tela inicial na tela inteira
	call clickstart       ; Rotina de só carregar o jogo quando clicar enter
	jmp main

restart:
	call ApagaTela
	loadn R1, #tela6Linha0
	loadn R2, #0
	call ImprimeTela
	call highscoreprint
	call clickstart
	jmp main

main:
	call ApagaTela

	loadn R1, #tela1Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn R2, #2304  			; carrega cor!
	call ImprimeTela2   		;  Rotina de Impresao de Cenario na Tela Inteira
    
	loadn R1, #tela2Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn R2, #512  			; carrega a cor!
	call ImprimeTela2   		;  Rotina de Impresao de Cenario na Tela Inteira
    
	loadn R1, #tela3Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn R2, #2816   			; carrega a cor!
	call ImprimeTela2   		;  Rotina de Impresao de Cenario na Tela Inteira

	loadn R1, #tela4Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn R2, #256   			; carrega a cor!
	call ImprimeTela2   		;  Rotina de Impresao de Cenario na Tela Inteira

	loadn r1, #0
	store scoretable, r1
	call printscore1

    Loadn R0, #1140			
	store posCesto, R0		; Zera Posicao Atual do cesto
	store posAntCesto, R0	; Zera Posicao Anterior do cesto
	call MoveCesto_Desenha

    Loadn R0, #735
	store posMaca, R0		; Zera Posicao Atual da maçã
	store posAntMaca, R0	; Zera Posicao Anterior da maçã
    
    Loadn r0, #10
    store posPombo, r0		;Zera a posição do pombo
    store posAntPombo, r0	;Zera a posição anterior do pombo

    Loadn r0, #10
    store posMerdaPombo, r0			;Zera a posição da merda do pombo
    store posAntMerdaPombo, r0		;Zera a posição anterior da merda do pombo
    Loadn R0, #0			; Contador para os Mods	= 0
	loadn R2, #0			; Para verificar se (mod(c/10)==0
    store score, R0	; Zera o score do jogo
    Loop:
    
        
        loadn R1, #17
	    mod R1, R0, R1
	    cmp R1, R2		; if (mod(c/30)==0
	    ceq MoveMaca	; Chama Rotina de movimentacao da Maçã
        call Macafora
	
        loadn R1, #100
	    mod R1, R0, R1
	    cmp R1, R2		; if (mod(c/100)==0
	    ceq Movepombo	; Chama a rotina de movimentação do Pombo
        call Pombofora
		
		loadn R1, #13
        mod R1, R0, R1
        cmp R1, R2    		;if(mod(c/30))==0
        ceq MoveMerdaPombo 	; Chama a rotina de movimentação da merda do pombo
        call MerdaPombofora

        loadn R1, #5
		mod R1, R0, R1
		cmp R1, R2		; if (mod(c/10)==0
		ceq MoveCesto	; Chama a rotina de movimentação do cesto

        call Delay
		inc R0 	;c++
		jmp Loop

highscoreprint: ;Função para printar na tela a maior pontuação
	push r0 
	push r1
	push r2
	push r5
	push r6
	load r1, highscore
	load r2, scoretable
	cmp r2,r1 ; Compara a maior pontuação antiga com a pontuação no jogo atual
	cgr aumentouhighscore ;Se for maior salva a nova pontuação nessa função 
	load r5, highscore
	loadn r6, #983
	call PrintR5R6 ;Imprime na tela a maior pontuação
	pop r6
	pop r5
	pop r2
	pop r1
	pop r0
	rts
aumentouhighscore:
	store highscore, r2
	rts

Pombofora: ; Após a merda do pombo chegar ao solo, ele reinicia para cair uma nova merda
    push r0
    push r1
    push r2 
    
    load r0, posPombo
    loadn r1, #1120
    cmp r0, r1 ; Se a posição do pombo for muito baixa, ele retorna para cima
    pop r2
    pop r1
    pop r0
    ceq PomboVolta
    rts
    
PomboVolta: ;Reinicia a merda do pombo
	push R0
	push R1
	call Movepombo_Apaga
	loadn r0, #1
    store posAntPombo, r0
    store posPombo, r0
    pop r1
    pop r0
    rts
colisaomacachao: ; Quando a mação encosta no chão
    push r0   ;Perde o jogo, e vai pra tela de restart
    push r1
    push r2
    load r1, posMaca
    loadn r2, #1160
    cmp r1, r2
    cgr deuruim2 
    pop r2
    pop r1
    pop r0
    rts

deuruim2:
    pop r2
    pop r1
    pop r0
    jmp restart ;Vai para o restart do jogo
	rts

colisaomacacesto: ;Se a maçã estiver na mesma posição do cestod
    push r0 
    push r1
    push r2
    load r0, posMaca; A pontuação aumenta e a maçã vai para a proxima posição
    load r2, posMaca1
    load r1, posCesto 
    cmp r0, r1
    ceq aumentascore
    cmp r2, r1 
    pop r2
    pop r1
    pop r0 
    rts

aumentascore: ;Função para aumentar a posição
    push r0
    push r1
	push r5
	push r6

    load r0, scoretable ; Carrega a pontuação atual
    inc r0 ;Incrementa e depois salva
    store scoretable, r0
	call Macavolta
	call MoveCesto_Desenha ;Reinicia a posição da maçã

	call printscore

    pop r6
	pop r5
	pop r1
    pop r0
    rts

colisao:
    push r0 ; Se a Merda da posição for igual a posição do cesto
    push r1 ;Chama a função deu ruim que chama a restart, ou seja game over
    push r2
    load r0, posMerdaPombo
    load r1, posCesto
    cmp r1, r0
    ceq deuruim
    pop r2
    pop r1
    pop r0
    rts
deuruim:
    pop r2
    pop r1
    pop r0
    jmp restart ;Chama a função restart

clickstart: ; Fica esperando a pessoa apertar espaço para começar
	push r1
	push r2 
	clickstart_loop:
	inchar r1
	loadn r2, #' '
	cmp r1, r2 ;Compara a tecla digitada com espaço, se for igual, ele começa o jogo 
	jeq finish
	jmp clickstart_loop
	rts

	finish:
	pop r2
	pop r1
	rts


MoveMerdaPombo:
	push r0
	push r1
	
	call MoveMerdaPombo_RecalculaPos ;Calcula a posição da merda do pombo depois do instante		
	load r0, posMerdaPombo ;armazena nos registradores as posições do item
	load r1, posAntMerdaPombo
	call MoveMerdaPombo_Apaga ; chama a rotina de desenho e de apagar o item do cenario
	call MoveMerdaPombo_Desenha
	call colisao
	pop r1
	pop r0
	rts

  MoveMerdaPombo_Apaga:	
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5

	load R0, posAntMerdaPombo	; R0 = posAnt
	
	; --> R2 = Tela1Linha0 + posAnt + posAnt/40  ; tem que somar posAnt/40 no ponteiro pois as linas da string terminam com /0 !!

	loadn R1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	add R2, R1, r0	; R2 = Tela1Linha0 + posAnt
	loadn R4, #40
	div R3, R0, R4	; R3 = posAnt/40
	add R2, R2, R3	; R2 = Tela1Linha0 + posAnt + posAnt/40
	
	loadi R5, R2	; R5 = Char (Tela(posAnt))
	
	outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts


MerdaPombofora: ; Após a merda do pombo chegar ao solo, ele reinicia para cair uma nova merda
    push r0
    push r1
    push r2 
    
    load r0, posMerdaPombo
    loadn r1, #1200
    cmp r0, r1 
    pop r2
    pop r1
    pop r0
    jgr MerdaPomboVolta
    rts
    
    MerdaPomboVolta: ;Reinicia a merda do pombo
	push R0
	push R1
	load r0, posPombo
    load r1, #1
    sub, r0, r0, r1
    store posAntMerdaPombo, r0
    store posMerdaPombo, r0
    pop r1
    pop r0
    rts
MoveMerdaPombo_RecalculaPos:		
	push R0
	push R1
	push R2
	push R3

	load R0, posMerdaPombo
	
	loadn R1, #40
	add R0,R1,R0	; Faz a merda do pombo cair
	store posMerdaPombo, R0
	pop R3
	pop R2
	pop R1
	pop R0
	rts



MoveMerdaPombo_Desenha:	; Desenha caractere da merda do Pombo
	push R0
	push R1
	
	Loadn R1, #'L'	; Merda do Pombo
	load R0, posMerdaPombo
	outchar R1, R0
	store posAntMerdaPombo, R0	; Atualiza Posicao Anterior da merda do pombo pombo = Posicao Atual
	
	pop R1
	pop R0
	rts

Movepombo:
	push r0
	push r1
	
	call Movepombo_RecalculaPos		; Recalcula Posicao do pombo
	load r0, posPombo
	load r1, posAntPombo			;Mesmo esquema da função da merda do pombo para os itens
	call Movepombo_Apaga
	call Movepombo_Desenha
	pop r1
	pop r0
	rts
  Movepombo_Apaga:	
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5

	load R0, posAntPombo	; R0 = posAnt
	
	; --> R2 = Tela1Linha0 + posAnt + posAnt/40  ; tem que somar posAnt/40 no ponteiro pois as linas da string terminam com /0 !!

	loadn R1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	add R2, R1, r0	; R2 = Tela1Linha0 + posAnt
	loadn R4, #40
	div R3, R0, R4	; R3 = posAnt/40
	add R2, R2, R3	; R2 = Tela1Linha0 + posAnt + posAnt/40
	
	loadi R5, R2	; R5 = Char (Tela(posAnt))
	
	outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
	
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts
Movepombo_RecalculaPos:		
	push R0
	push R1
	push R2
	push R3

	load R0, posPombo
	
	loadn R1, #1
	add R0,R1,R0	;Adiciona 1 na posição do pombo
	store posPombo, R0
	pop R3
	pop R2
	pop R1
	pop R0
	rts



Movepombo_Desenha:	; Desenha caractere do pombo
	push R0
	push R1
	
	Loadn R1, #'P'	; pombo
	load R0, posPombo
	outchar R1, R0
	store posAntPombo, R0	; Atualiza Posicao Anterior do pombo = Posicao Atual
	
	pop R1
	pop R0
	rts
MoveCesto:
	push r0
	push r1
	
	call MoveCesto_RecalculaPos		; Recalcula Posicao do cesto

    ; So' Apaga e Redesenha se (pos != posAnt)
    ;	If (posCesto != posAntCesto)	{	
	load r0, posCesto
	load r1, posAntCesto
	cmp r0, r1
	jeq MoveCesto_Skip
		call MoveCesto_Apaga
		call MoveCesto_Desenha		;}
  MoveCesto_Skip:
	
	pop r1
	pop r0
	rts

MoveCesto_Apaga:		; Apaga o Cesto preservando o Cenario!
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5

	load R0, posAntCesto	; R0 = posAnt
	
	; --> R2 = Tela1Linha0 + posAnt + posAnt/40  ; tem que somar posAnt/40 no ponteiro pois as linas da string terminam com /0 !!

	loadn R1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	add R2, R1, r0	; R2 = Tela1Linha0 + posAnt
	loadn R4, #40
	div R3, R0, R4	; R3 = posAnt/40
	add R2, R2, R3	; R2 = Tela1Linha0 + posAnt + posAnt/40
	
	loadi R5, R2	; R5 = Char (Tela(posAnt))
	
	outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
	
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts

MoveCesto_RecalculaPos:		; Recalcula posicao do cesto em funcao das Teclas pressionadas
	push R0
	push R1
	push R2
	push R3

	load R0, posCesto
	
	inchar R1				; Le Teclado para controlar o cesto apenas as teclas a e d (o cesto anda de um lado pro outro)
	loadn R2, #'a'
	cmp R1, R2
	jeq MoveCesto_RecalculaPos_A
	
	loadn R2, #'d'
	cmp R1, R2
	jeq MoveCesto_RecalculaPos_D
		
MoveCesto_RecalculaPos_Fim:	; Se nao for nenhuma tecla valida, vai embora
	store posCesto, R0
	pop R3
	pop R2
	pop R1
	pop R0
	rts

 MoveCesto_RecalculaPos_A:	; Move cesto para Esquerda
	loadn R1, #40
	loadn R2, #0
	mod R1, R0, R1		; Testa condicoes de Contorno 
	cmp R1, R2
	jeq MoveCesto_RecalculaPos_Fim
	dec R0	; pos = pos -1
	jmp MoveCesto_RecalculaPos_Fim
		
  MoveCesto_RecalculaPos_D:	; Move cesto para Direita	
	loadn R1, #40
	loadn R2, #39
	mod R1, R0, R1		; Testa condicoes de Contorno 
	cmp R1, R2
	jeq MoveCesto_RecalculaPos_Fim
	inc R0	; pos = pos + 1
	jmp MoveCesto_RecalculaPos_Fim


MoveCesto_Desenha:	; Desenha caractere do cesto
	push R0
	push R1
	
	Loadn R1, #'G'	; Cesto
	load R0, posCesto
	outchar R1, R0
	store posAntCesto, R0	; Atualiza Posicao Anterior do cesto = Posicao Atual
	
	pop R1
	pop R0
	rts


MoveMaca:
	push r0
	push r1
	
	call MoveMaca_RecalculaPos		; Recalcula Posicao da maçã

	load r0, posMaca
	load r1, posAntMaca
	call MoveMaca_Apaga
	call MoveMaca_Desenha
    call colisaomacacesto
    call colisaomacachao
	pop r1
	pop r0
	rts
  MoveMaca_Apaga:	
	push R0
	push R1
	push R2
	push R3
	push R4
	push R5

	load R0, posAntMaca	; R0 = posAnt
	
	; --> R2 = Tela1Linha0 + posAnt + posAnt/40  ; tem que somar posAnt/40 no ponteiro pois as linas da string terminam com /0 !!

	loadn R1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	add R2, R1, r0	; R2 = Tela1Linha0 + posAnt
	loadn R4, #40
	div R3, R0, R4	; R3 = posAnt/40
	add R2, R2, R3	; R2 = Tela1Linha0 + posAnt + posAnt/40
	
	loadi R5, R2	; R5 = Char (Tela(posAnt))
	
	outchar R5, R0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
	
	pop R5
	pop R4
	pop R3
	pop R2
	pop R1
	pop R0
	rts
MoveMaca_RecalculaPos:		; Recalcula posicao da maçã em relação a sua queda
	push R0
	push R1
	push R2
	push R3

	load R0, posMaca
	
	loadn R1, #40
	add R0,R1,R0	; Adiciona 40 para descer uma linha, como se fosse a gravidade
	store posMaca, R0
	pop R3
	pop R2
	pop R1
	pop R0
	rts



MoveMaca_Desenha:	; Desenha caractere da maçã
	push R0
	push R1
	
	Loadn R1, #'A'	; Maçã
	load R0, posMaca
	outchar R1, R0
	store posAntMaca, R0	; Atualiza Posicao Anterior da Maçã = Posicao Atual
	
	pop R1
	pop R0
	rts


Macafora: ;Função para calcular caso a maçã esteja indo para fora do cenário
    push r0
    push r1
    push r2 
    
    load r0, posMaca
    loadn r1, #1200
    cmp r0, r1 
    pop r2
    pop r1
    pop r0
    jgr Macavolta
    rts
    
    Macavolta: ; Caso a maçã esteja indo para fora do cenário, ela retorna em outra posição
	push R0
	push R1
	push R2
	push R3
	
    loadn R2, #Rand 	
	load R1, IncRand	
	add r2, r2, r1		
						
	loadi R3, R2 		
								
	inc r1				
	loadn r2, #30
	cmp r1, r2			; Compara com o Final da Tabela e re-estarta em 0
	jne MoveMacaPos_Skip
		loadn r1, #0		; re-estarta a Tabela Rand em 0
  MoveMacaPos_Skip:
	store IncRand, r1	; Salva incremento ++
    store posMaca, r3
    store posAntMaca, r3
    pop r3
    pop r2
    pop r1
    pop r0
    rts

perdeu: 
	rts
Delay:
						;Utiliza Push e Pop para nao afetar os Ristradores do programa principal
	Push R0
	Push R1
	
	Loadn R1, #50  ; a
   Delay_volta2:				;Quebrou o contador acima em duas partes (dois loops de decremento)
	Loadn R0, #50	; b
   Delay_volta: 
	Dec R0					; (4*a + 6)b = 1000000  == 1 seg  em um clock de 1MHz
	JNZ Delay_volta	
	Dec R1
	JNZ Delay_volta2
	
	Pop R1
	Pop R0
	
	RTS							;return

printscore1: ;Função de printar na tela a palavra score 
    push r0
    push r1

    loadn r0, #'s'
    loadn r1, #0
    outchar r0, r1

    inc r1
    loadn r0, #'c'
    outchar r0, r1

    inc r1
    loadn r0, #'o'
    outchar r0, r1

    inc r1
    loadn r0, #'r'
    outchar r0, r1

    inc r1
    loadn r0, #'e'
    outchar r0, r1

    inc r1
    loadn r0, #':'
    outchar r0, r1

    inc r1
    inc r1
    loadn r0, #'0' ;Imprime na tela o score logo após a escrita score:
    outchar r0, r1  

    inc r1
    loadn r0, #'0'
    outchar r0, r1

	pop r0
	pop r1
	rts

printscore:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5

	loadn r0, #'s'
	loadn r1, #0
	outchar r0, r1

	load r0, scoretable
	loadn r1, #10
	loadn r2, #48
	loadn r4, #7

	div r3, r0, r1

	add r5, r3, r2
	outchar r5, r4

	inc r4

	mul r3, r3, r1
	sub r3, r0, r3

	add r5, r3, r2
	outchar r5, r4

	pop r0
	pop r1
	pop r2
	pop r3
	pop r4
	pop r5
	rts

ApagaTela:
	push r0
	push r1
	
	loadn r0, #1200		; apaga as 1200 posicoes da Tela
	loadn r1, #' '		; com "espaco"
	
	   ApagaTela_Loop:	;;label for(r0=1200;r3>0;r3--)
		dec r0
		outchar r1, r0
		jnz ApagaTela_Loop
 
	pop r1
	pop r0
	rts	

ImprimeTela2: 	;  Rotina de Impresao de Cenario na Tela Inteira
		;  r1 = endereco onde comeca a primeira linha do Cenario
		;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	loadn R6, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	
   ImprimeTela2_Loop:
		call ImprimeStr2
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		add r6, r6, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeTela2_Loop	; Enquanto r0 < 1200

	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

ImprimeStr2:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina
	
	
	loadn r3, #'\0'	; Criterio de parada
	loadn r5, #' '	; Espaco em Branco

   ImprimeStr2_Loop:	
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeStr2_Sai
		cmp r4, r5		; If (Char == ' ')  vai Pula outchar do espaco para na apagar outros caracteres
		jeq ImprimeStr2_Skip
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
   		storei r6, r4
   ImprimeStr2_Skip:
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		inc r6
		jmp ImprimeStr2_Loop
	
   ImprimeStr2_Sai:	
	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	

ImprimeTela: 	;  Rotina de Impresao de Cenario na Tela Inteira
		;  r1 = endereco onde comeca a primeira linha do Cenario
		;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r4 na pilha para ser usado na subrotina

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	
   ImprimeTela_Loop:
		call ImprimeStr
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeTela_Loop	; Enquanto r0 < 1200

	pop r5	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts

ImprimeStr:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #'\0'	; Criterio de parada

   ImprimeStr_Loop:	
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeStr_Sai
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		jmp ImprimeStr_Loop
	
   ImprimeStr_Sai:	
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	PrintR5R6:	; R5 contem um numero de ate' 2 digitos     e    R6 a posicao onde vai imprimir na tela
	Push R0
	Push R1
	Push R2
	Push R3
	
	Loadn R0, #10
	Loadn R2, #48
	Div R1, R5, R0	; Divide o numeo por 10 para imprimir a dezena
	Add R3, R1, R2	; Soma 48 ao numero pra dar o Cod.  ASCII do numero
	Outchar R3, R6
	
	Inc R6			; Incrementa a posicao na tela
	
	Mul R1, R1, R0	; Multiplica a dezena por 10
	Sub R1, R5, R1	; Pra subtrair do numero e pegar o resto
	
	Add R1, R1, R2	; Soma 48 ao numero pra dar o Cod.  ASCII do numero
	Outchar R1, R6
	
	Pop R3
	Pop R2
	Pop R1
	Pop R0
	rts





tela0Linha0  : string "                                        "
tela0Linha1  : string "                                        "
tela0Linha2  : string "                                        "
tela0Linha3  : string "                                        "
tela0Linha4  : string "                                        "
tela0Linha5  : string "                                        "
tela0Linha6  : string "                                        "
tela0Linha7  : string "                                        "
tela0Linha8  : string "                                        "
tela0Linha9  : string "                                        "
tela0Linha10 : string "                                        "
tela0Linha11 : string "                                        "
tela0Linha12 : string "                                        "
tela0Linha13 : string "                                        "
tela0Linha14 : string "                                        "
tela0Linha15 : string "                                        "
tela0Linha16 : string "                                        "
tela0Linha17 : string "                                        "
tela0Linha18 : string "                                        "
tela0Linha19 : string "                                        "
tela0Linha20 : string "                                        "
tela0Linha21 : string "                                        "
tela0Linha22 : string "                                        "
tela0Linha23 : string "                                        "
tela0Linha24 : string "                                        "
tela0Linha25 : string "                                        "
tela0Linha26 : string "                                        "
tela0Linha27 : string "                                        "
tela0Linha28 : string "                                        "
tela0Linha29 : string "                                        "	

; Declara e preenche tela linha por linha (40 caracteres):
; Declara e preenche tela linha por linha (40 caracteres):
tela1Linha0  : string "                                        "
tela1Linha1  : string "                                        "
tela1Linha2  : string "                                        "
tela1Linha3  : string "                           SMMMMMR      "
tela1Linha4  : string "                         SMMMMMMMMMMMR  "
tela1Linha5  : string "                         QMMMMMMMMMMMT  "
tela1Linha6  : string "                           QMMMT        "
tela1Linha7  : string "                                        "
tela1Linha8  : string "                                        "
tela1Linha9  : string "                                        "
tela1Linha10 : string "                                        "
tela1Linha11 : string "                                        "
tela1Linha12 : string "                                        "
tela1Linha13 : string "                                        "
tela1Linha14 : string "                                        "
tela1Linha15 : string "                                        "
tela1Linha16 : string "                                        "
tela1Linha17 : string "                                        "
tela1Linha18 : string "                                        "
tela1Linha19 : string "                                        "
tela1Linha20 : string "                                        "
tela1Linha21 : string "                                        "
tela1Linha22 : string "                                        "
tela1Linha23 : string "                                        "
tela1Linha24 : string "                                        "
tela1Linha25 : string "                                        "
tela1Linha26 : string "                                        "
tela1Linha27 : string "                                        "
tela1Linha28 : string "                                        "
tela1Linha29 : string "                                        "



; Declara e preenche tela linha por linha (40 caracteres):
tela2Linha0  : string "                                        "
tela2Linha1  : string "                                        "
tela2Linha2  : string "                                        "
tela2Linha3  : string "                                        "
tela2Linha4  : string "                                        "
tela2Linha5  : string "                                        "
tela2Linha6  : string "                                        "
tela2Linha7  : string "                                        "
tela2Linha8  : string "            CBBBBBBBBBBBD               "
tela2Linha9  : string "          CBBBBBBBBBBBBBBBBBBD          "
tela2Linha10 : string "          BBBBBBBBBBBBBBBBBBBB          "
tela2Linha11 : string "         CBBBBBBBBBBBBBBBBBBBBD         "
tela2Linha12 : string "        CBBBBBBBBBBBBBBBBBBBBBB         "
tela2Linha13 : string "        BBBBBBBBBBBBBBBBBBBBBBBD        "
tela2Linha14 : string "        BBBBBBBBBBBBBBBBBBBBBBBBBD      "
tela2Linha15 : string "       CBBBBBBBBBBBBBBBBBBBBBBBBBBD     "
tela2Linha16 : string "     CBBBBBBBBBBBBBBBBBBBBBBBBBBBBB     "
tela2Linha17 : string "     BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBD    "
tela2Linha18 : string "    CBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBD  "
tela2Linha19 : string "  CBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  "
tela2Linha20 : string "  BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  "
tela2Linha21 : string "  BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB  "
tela2Linha22 : string "  OBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBN  "
tela2Linha23 : string "       OBBBBBBBBBBBBBBBBBBBBBBBBN       "
tela2Linha24 : string "         OBBBBBBBBBBBBBBBBBN            "
tela2Linha25 : string "                                        "
tela2Linha26 : string "                                        "
tela2Linha27 : string "                                        "
tela2Linha28 : string "                                        "
tela2Linha29 : string "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"


; Declara e preenche tela linha por linha (40 caracteres):
tela3Linha0  : string "                                        "
tela3Linha1  : string "                                        "
tela3Linha2  : string "  .  |  .                               "
tela3Linha3  : string "   SMMMR                                "
tela3Linha4  : string " - MMMMM -                              "
tela3Linha5  : string "   QMMMT                                "
tela3Linha6  : string "  .  |  .                               "
tela3Linha7  : string "                                        "
tela3Linha8  : string "                                        "
tela3Linha9  : string "                                        "
tela3Linha10 : string "                                        "
tela3Linha11 : string "                                        "
tela3Linha12 : string "                                        "
tela3Linha13 : string "                                        "
tela3Linha14 : string "                                        "
tela3Linha15 : string "                                        "
tela3Linha16 : string "                                        "
tela3Linha17 : string "                                        "
tela3Linha18 : string "                                        "
tela3Linha19 : string "                                        "
tela3Linha20 : string "                                        "
tela3Linha21 : string "                                        "
tela3Linha22 : string "                                        "
tela3Linha23 : string "                                        "
tela3Linha24 : string "                                        "
tela3Linha25 : string "                                        "
tela3Linha26 : string "                                        "
tela3Linha27 : string "                                        "
tela3Linha28 : string "                                        "
tela3Linha29 : string "                                        "


tela4Linha0  : string "                                        "
tela4Linha1  : string "                                        "
tela4Linha2  : string "                                        "
tela4Linha3  : string "                                        "
tela4Linha4  : string "                                        "
tela4Linha5  : string "                                        "
tela4Linha6  : string "                                        "
tela4Linha7  : string "                                        "
tela4Linha8  : string "                                        "
tela4Linha9  : string "                                        "
tela4Linha10 : string "                                        "
tela4Linha11 : string "               MM MMM                   "
tela4Linha12 : string "                 MMMM                   "
tela4Linha13 : string "                  MMM      M            "
tela4Linha14 : string "          M       MMM      M            "
tela4Linha15 : string "          M       MMM    MM             "
tela4Linha16 : string "           MMMM   MMM   M    MMM        "
tela4Linha17 : string "         MM    MM MMM   M MMM           "
tela4Linha18 : string "                 MMMM MM M   M          "
tela4Linha19 : string "                  MMMM           M      "
tela4Linha20 : string "        M M       MMM          MM       "
tela4Linha21 : string "         M        MMM       MMM  M      "
tela4Linha22 : string "          MMM     MMM    MMM            "
tela4Linha23 : string "             MM   MMM  MM               "
tela4Linha24 : string "               MM MMMMM                 "
tela4Linha25 : string "                M MMM                   "
tela4Linha26 : string "                 MMMM                   "
tela4Linha27 : string "                  MMM                   "
tela4Linha28 : string "                  MMM                   "
tela4Linha29 : string "                  MMM                   "

tela5Linha0  : string "                                        "
tela5Linha1  : string "                                        "
tela5Linha2  : string "            CBBBBBBBBBBBD               "
tela5Linha3  : string "          CBBBBBBBBBBBBBBBBBBD          "
tela5Linha4  : string "          BBBBBBBBBBBBBBBBBBBB          "
tela5Linha5  : string "         CBBBBBBBBBBBBBBBBBBBBD         "
tela5Linha6  : string "        CBBBBBBBBBBBBBBBBBBBBBB         "
tela5Linha7  : string "        BBBBBBBBBBBBBBBBBBBBBBBD        "
tela5Linha8  : string "        BBBBBBBBBBBBBBBBBBBBBBBBBD      "
tela5Linha9  : string "       CBBBBBBBBBBBBBBBBBBBBBBBBBBD     "
tela5Linha10 : string "     CBBBBBBBBBBBBBBBBBBBBBBBBBBBBB     "
tela5Linha11 : string "     BBBB   B   B B B   B   B   BBBD    "
tela5Linha12 : string "    CBBBB B B B B B B B B B B BBBBBBBD  "
tela5Linha13 : string "  CBBBBBB   B   B B B B B   B  BBBBBBB  "
tela5Linha14 : string "  BBBBBBB B B  BB B B B B  BB BBBBBBBB  "
tela5Linha15 : string "  BBBBBBB B B B BB BB   B B B   BBBBBB  "
tela5Linha16 : string "  OBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBN  "
tela5Linha17 : string "       OBBBBBBBBBBBBBBBBBBBBBBBBN       "
tela5Linha18 : string "         OBBBBBBBBBBBBBBBBBN            "
tela5Linha19 : string "                  BBB                   "
tela5Linha20 : string "                  BBB                   "
tela5Linha21 : string "                  BBB                   "
tela5Linha22 : string "                  BBB                   "
tela5Linha23 : string "                                        "
tela5Linha24 : string "                                        "
tela5Linha25 : string "                                        "
tela5Linha26 : string "       clique [space] para comecar      "
tela5Linha27 : string "                                        "
tela5Linha28 : string "                                        "
tela5Linha29 : string "                                        "


tela6Linha0  : string "                                        "
tela6Linha1  : string "                                        "
tela6Linha2  : string "            CBBBBBBBBBBBD               "
tela6Linha3  : string "          CBBBBBBBBBBBBBBBBBBD          "
tela6Linha4  : string "          BBBBBBBBBBBBBBBBBBBB          "
tela6Linha5  : string "         CBB   B   B B B   BBBD         "
tela6Linha6  : string "        CBBB BBB B B   B BBBBBB         "
tela6Linha7  : string "        BBBB B B   B B B  BBBBBD        "
tela6Linha8  : string "        BBBB B B B B B B BBBBBBBBD      "
tela6Linha9  : string "       CBBBB   B B B B B   BBBBBBBD     "
tela6Linha10 : string "     CBBBBBBBBBBBBBBBBBBBBBBBBBBBBB     "
tela6Linha11 : string "     BBBBBBBBB   B B B   B   BBBBBBD    "
tela6Linha12 : string "    CBBBBBBBBB B B B B BBB B BBBBBBBBD  "
tela6Linha13 : string "  CBBBBBBBBBBB B B B B  BB   BBBBBBBBB  "
tela6Linha14 : string "  BBBBBBBBBBBB B B B B BBB  BBBBBBBBBB  "
tela6Linha15 : string "  BBBBBBBBBBBB   BB BB   B B BBBBBBBBB  "
tela6Linha16 : string "  OBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBN  "
tela6Linha17 : string "       OBBBBBBBBBBBBBBBBBBBBBBBBN       "
tela6Linha18 : string "         OBBBBBBBBBBBBBBBBBN            "
tela6Linha19 : string "                  BBB                   "
tela6Linha20 : string "                  BBB                   "
tela6Linha21 : string "                  BBB                   "
tela6Linha22 : string "                  BBB                   "
tela6Linha23 : string "                                        "
tela6Linha24 : string "            highscore:                  "
tela6Linha25 : string "                                        "
tela6Linha26 : string "      clique [space] para recomecar     "
tela6Linha27 : string "                                        "
tela6Linha28 : string "                                        "
tela6Linha29 : string "                                        "