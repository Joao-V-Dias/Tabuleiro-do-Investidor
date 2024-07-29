programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Teclado --> t
	inclua biblioteca Util --> u
	

	funcao inicio()
	{
		inteiro logo = g.carregar_imagem("logo.PNG")
		inteiro opcao = -1, player1Ponto = 0, player2Ponto = 0
		
		g.iniciar_modo_grafico(verdadeiro)
		//g.definir_dimensoes_janela(1700, 900)
		g.entrar_modo_tela_cheia()
				
		
        	enquanto (verdadeiro)
        	{
        		g.definir_cor(g.COR_BRANCO)
			g.limpar()
			g.definir_cor(g.COR_PRETO)
			g.definir_tamanho_texto(32.00)
			g.desenhar_imagem(550, 10, logo)
          	g.desenhar_texto(64, 400, "1 - Jogar")
          	g.desenhar_texto(64, 430, "2 - Resultado")
           	g.desenhar_texto(64, 460, "3 - Sair")
            	g.desenhar_texto(64, 500, "Digite o númeror da opção que deseja! ")

			g.renderizar()

			se (t.tecla_pressionada(t.TECLA_1)){
           		opcao = 1
        		}
        		se (t.tecla_pressionada(t.TECLA_2)){
            		opcao = 2
        		}
        		se (t.tecla_pressionada(t.TECLA_3)){
            		opcao = 3
        		}

        		se(opcao != -1){
        			escolha(opcao)
            		{
	               	caso 1:
	                    	inteiro resultadoJogo = jogar()
	                    	se(resultadoJogo == 1){
	                    		player1Ponto++
	                    	}senao{
	                    		player2Ponto++
	                    	}
	                    	opcao = -1
	                    	pare
	                	caso 2:
	                    	resultado(player1Ponto, player2Ponto)
	                    	opcao = -1
	                    	pare
	                	caso 3:
	                    	g.fechar_janela()
	                    	opcao = -1
	                    	pare
	                	caso contrario:
	                    	opcao = -1
	                    	pare
				}
        		}
		}
	}

	funcao resultado(inteiro player1Ponto, inteiro player2Ponto){
		inteiro ponto[2]

		ponto[0] = player1Ponto
		ponto[1] = player2Ponto
		
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
		g.definir_cor(g.COR_PRETO)
		g.desenhar_texto(700, 200, "Número de Vitórias!")
		para(inteiro i = 1; i <= 2 ; i++){
			g.desenhar_retangulo(420 * i, 400, 420, 76, falso, falso)
			g.desenhar_texto((420 * i) + 5, 402, "Jogador " + i)
			g.desenhar_linha(420 * i, 439, (420 * i) + 420, 439)
			g.desenhar_texto((420 * i) + 5, 440, ponto[i - 1] + "")
		}
		g.desenhar_texto(650, 550, "Aperte ESC para voltar!")
		g.renderizar()

		enquanto(verdadeiro){
			se(t.tecla_pressionada(t.TECLA_ESC)){
				pare
			}
		}
		
	}

	funcao exibeTabuleiro(inteiro player1P, inteiro player2P, cadeia texto, inteiro temporizador)
    	{
		inteiro player1Img = g.carregar_imagem("1.png")
		inteiro player2Img = g.carregar_imagem("2.png")
		inteiro fim = g.carregar_imagem("fim.png")
    		
    		     g.definir_cor(g.COR_BRANCO)
			g.limpar()
			g.definir_cor(g.COR_PRETO)
			
     	para(inteiro i = 1; i <= 20; i++)
        	{
        		g.definir_tamanho_texto(22.00)
        		g.desenhar_texto(64, 70, texto + "")
        		g.definir_tamanho_texto(12.00)
        		g.desenhar_retangulo(76 * i, 400, 76, 76, falso, falso)
        		g.desenhar_texto((76 * i) + 2, 402, i + "")
            	
            	se(i == player1P)
            	{
                	g.desenhar_imagem(76 * i, 410, player1Img)
            	}
            	se(i == player2P)
            	{
               	g.desenhar_imagem((76 * i) + 35, 410, player2Img)
            	}
            	se(i == 20){
            		g.desenhar_imagem(76 * i, 345, fim)
            	}
		}
		g.renderizar()
        	u.aguarde(temporizador)
	}

    	funcao inteiro verificaCasa(inteiro player, inteiro player1P, inteiro player2P, inteiro vez)
    	{
    		cadeia texto = ""
    		inteiro trocaCasa = 0
		exibeTabuleiro(player1P, player2P, texto, 1500)

        	g.definir_cor(g.COR_BRANCO)
		g.limpar()
		g.definir_cor(g.COR_PRETO)
        
        	escolha(player)
        	{
          	caso 2:
          		texto = "Você encontrou uma oportunidade incrível de comprar ações baratas. \nAproveitando o momento, você dá um salto para a Casa 5."
                	player = 5
            	pare
            	caso 3:
            		texto = "Hora de avaliar os riscos. \nVocê tira um tempo para analisar suas opções e joga um dado extra de 1 a 3 para ver onde isso te leva."
                	player += u.sorteia(1, 3)
            	pare
            	caso 4:
            		texto = "Seus primeiros investimentos estão rendendo um pouco. Não é uma fortuna, mas é um bom começo!"
        		pare
        		caso 5:
        			texto = "Decidido a não colocar todos os ovos na mesma cesta, você expande seu portfólio, aumentando suas chances de sucesso."
        		pare
        		caso 6:
        			texto = "As notícias não são ótimas, mas você está bem por ter diversificado. Segue em frente, mas de olho no mercado."
        		pare
        		caso 7:
        			texto = "O mercado está agitado! Você decide esperar uma rodada para ver como as coisas se desenrolam. \nFique uma rodada sem jogar!"
        		pare
        		caso 8:
        			texto = "Uma nova tecnologia está fazendo barulho. Você investe em empresas de tecnologia, esperando que seja um bom movimento."
        		pare
        		caso 9:
        			texto = "Você conversa com alguns especialistas que te dão dicas valiosas. Agora você se sente mais preparado para os próximos passos."
        		pare
            	caso 10:
            		texto = "O mercado muda de repente e você precisa ajustar sua carteira. \nTroca de posição com outro jogador, tentando se reposicionar para o sucesso."
            		trocaCasa = player2P
        			player2P = player1P
        			player1P = trocaCasa
            	pare
            	caso 11:
            		texto = "O mercado está em alta e seus investimentos estão crescendo. Isso é um incentivo para seguir adiante."
        		pare
            	caso 12:
            		texto = "Você se precipitou e vendeu ações que poderiam ter crescido mais. \nUma lição de paciência aprendida, e você volta uma casa."
            		player -= 1
            	pare
            	caso 13:
            		texto = "A tentação de um investimento arriscado é grande. Você entra e, por sorte, começa a ver algum retorno."
        		pare
        		caso 14:
        			texto = "Suas ações estão pagando dividendos. É bom ver um retorno direto, reforçando sua confiança."
        		pare
            	caso 15:
               	cadeia cantou
               	texto = "\nCante um trecho de uma música, mostre confiança e siga em frente ou volte 2 casas. Aperte S para sim e N para não"
               	exibeTabuleiro(player1P, player2P, texto, 0)

				enquanto(verdadeiro){
					se(t.tecla_pressionada(t.TECLA_N)){
						player -= 2
						pare
					}
					se(t.tecla_pressionada(t.TECLA_S)){
						pare
					}
				}
               	
			pare
			caso 16:
				texto = "Você participa de eventos de investidores, ganhando insights e fazendo contatos úteis para o futuro."
        		pare
        		caso 17:
        			texto = "Suas boas práticas de investimento estão começando a dar frutos. Você sente que está no caminho certo."
        		pare
        		caso 18:
        			texto = "Novas regulamentações no mercado causam um pouco de confusão, mas acabam trazendo mais estabilidade. Isso é bom para os seus investimentos."
        		pare
            	caso 19:
            		texto = "O mercado desaba e você perde quase tudo. \nDe volta à estaca zero na Casa 1, é hora de começar novamente com mais sabedoria."
                	player = 1
            	pare
            	caso 20:
            		se(vez == 1){
            			texto = "Você superou todos os desafios e chegou ao topo como um investidor de sucesso. Parabéns, jogador 1 venceu!"
            		}senao{
            			texto = "Você superou todos os desafios e chegou ao topo como um investidor de sucesso. Parabéns, jogador 2 venceu!"
            		}
            	pare
        	}

        	se(vez == 1 e player != 10){
        		player1P = player
        		
        	}senao{
        		player2P = player
        	}
        	exibeTabuleiro(player1P, player2P, texto, 5000)

        	retorne player
	}

    	funcao inteiro jogar(){
        	inteiro dado = 0, vez = 1, player1P = 1, player2P = 1, bloqueio1P = 0, bloqueio2P = 0

        	enquanto(player1P < 20 e player2P < 20){
        		
            	g.definir_cor(g.COR_BRANCO)
			g.limpar()
			g.definir_cor(g.COR_PRETO)
			g.definir_tamanho_texto(32.00)

            	g.desenhar_texto(750, 200, "Vez do jogador " + vez + "!")
            	se(bloqueio1P == 1 e vez == 1 ou bloqueio2P == 1 e vez == 2){
            		g.desenhar_texto(710, 250, "Voce foi impedido de jogar!")
            		g.desenhar_texto(650, 500, "Aperte ENTER para passar a vez!")
            	}senao{
            		g.desenhar_texto(650, 500, "Para jogar o dado aperte ENTER!")
            	}
            	g.renderizar()

			enquanto(verdadeiro){
				se (t.tecla_pressionada(t.TECLA_ENTER)){
					dado = u.sorteia(1, 6)
					
		               g.definir_cor(g.COR_BRANCO)
					g.limpar()
					g.definir_cor(g.COR_PRETO)
		               g.desenhar_texto(750, 400, "Número Sorteado: " + dado)
		               g.renderizar()
		               u.aguarde(2000)
		               exibeTabuleiro(player1P, player2P, "" , 1000)
					
		           	se(vez == 1){
		                	se(bloqueio1P == 0){
		                		player1P += dado
			                	se(player1P > 20){
			                		player1P = 20	
			                	}
		                		player1P = verificaCasa(player1P, player1P, player2P, vez)

		                		se(player1P == 10){
			                		inteiro trocaCasa = player1P
			                		player1P = player2P
			                		player2P = trocaCasa
			                	}
			                	se(player1P == 7){
			                		bloqueio1P = 1
			                	}
		                	}senao{
		                		bloqueio1P = 0
		                	}
		                	vez = 2
		            	}
		            	senao{
		                	se(bloqueio2P == 0){
		                		player2P += dado
			                	se(player2P > 20){
			                		player2P = 20	
			               	}
		                		player2P = verificaCasa(player2P, player1P, player2P, vez)

		                		se(player2P == 10){
			                		inteiro trocaCasa = player1P
			                		player1P = player2P
			                		player2P = trocaCasa
			                	}
			                	se(player2P == 7){
			                		bloqueio2P = 1
			                	}
		                	}senao{
		                		bloqueio2P = 0
		                	}
		                	vez = 1
		            	}
		            	pare
				}
			}
		}
		se(player1P == 20){
			retorne 1
		}senao{
			retorne 2
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 8992; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
