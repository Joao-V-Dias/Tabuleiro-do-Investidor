programa
{
	inclua biblioteca Teclado --> t
	inclua biblioteca Util --> u
	

	funcao inicio()
	{
		inteiro opcao
        	enquanto (verdadeiro)
        	{
          	escreva("1 - Jogar\n")
          	escreva("2 - Resultado\n")
           	escreva("3 - Sair\n")
            	escreva("Digite a opção que deseja: ")

            	leia(opcao)

            	limpa()


            	escolha(opcao)
            	{
               	caso 1:
                    	jogar()
                	pare
                	caso 2:
                    	escreva("Resultado\n")
                	pare
                	caso 3:
                    	escreva("Saindo do programa...\n")
                    pare
                	caso contrario:
                    	escreva("Número inválido, digite novamente!\n")
			}
		}
	}

	funcao exibeTabuleiro(inteiro player1P, cadeia player1Nome, inteiro player2P, cadeia player2Nome)
    	{
     	para(inteiro i = 1; i <= 20; i++)
        	{
          	escreva("***************\n")
            	escreva(i)
            	se(i == player1P e i == player2P)
            	{
               	escreva("* ", player1Nome, " e ", player2Nome, " *\n")
            	}
            	senao se(i == player1P)
            	{
                	escreva("* ", player1Nome, " *\n")
            	}
            	senao se(i == player2P)
            	{
               	escreva("* ", player2Nome, " *\n")
            	}
            	senao
            	{
                	escreva("*          *\n")
            	}
		}
        	escreva("***************\n")
        	u.aguarde(3000)
	}

    	funcao inteiro verificaCasa(inteiro player, inteiro player1P, cadeia player1Nome, inteiro player2P, cadeia player2Nome)
    	{
		exibeTabuleiro(player1P, player1Nome, player2P, player2Nome)

        	limpa()
        
        	escolha(player)
        	{
          	caso 2:
               	escreva("Deve avançar o jogador para a casa 5.\n")
                	player = 5
                
            	pare
            	caso 3:
              		escreva("Deve jogar um dado adicional de 3 lados.\n")
                	player += u.sorteia(1, 3)
            	pare
            	caso 7:
                	escreva("Deve impedir que o jogador jogue o dado por 1 rodada.\n")
            	pare
            	caso 19:
                	escreva("Deve retroceder 1 casa.\n")
                	player -= 1
            	pare
            	caso 15:
               	cadeia cantou
                	escreva("Deve cantar um trecho de uma música (na vida real) ou voltar 2 casas.\n")
                	escreva("Cantou? (S - sim, N - não)\n")
                	leia(cantou)

               	se(cantou == "S" ou cantou == "s")
                	{
                	}
                	senao
                	{
                    	player -= 2
                	}
			pare
            	caso 20:
            		escreva("Venceu!\n")
        	}
        	retorne player
	}

    	funcao jogar()
    	{
        	inteiro dado, vez = 1, player1P = 0, player2P = 0
        	cadeia player1Nome, player2Nome

        	escreva("Nome do player 1: ")
        	leia(player1Nome)
        	escreva("Nome do player 2: ")
        	leia(player2Nome)

        	enquanto(player1P < 20 e player2P < 20)
        	{
            	limpa()

            	escreva("Pressione ENTER para a próxima rodada!\n")
            	t.tecla_pressionada(13)
            	

           	se(vez == 1)
            	{
                	escreva("Jogador da rodada:", player1Nome, "\n")
                	dado = u.sorteia(1, 6)
                	escreva("Dado: ", dado, "\n")
                	player1P += dado
                	se(player1P > 20){
                		player1P = 20	
                	}
                	player1P = verificaCasa(player1P, player1P, player1Nome, player2P, player2Nome)
                	vez = 2
            	}
            	senao
            	{
                	escreva("Jogador da rodada:", player2Nome, "\n")
                	dado = u.sorteia(1, 6)
                	escreva("Dado: ", dado, "\n")
                	player2P += dado
                	se(player2P > 20){
                	player2P = 20	
               }
                	player2P = verificaCasa(player2P, player1P, player1Nome, player2P, player2Nome)
                	vez = 1
            	}

            	exibeTabuleiro(player1P, player1Nome, player2P, player2Nome)
            	u.aguarde(3000)
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3337; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */