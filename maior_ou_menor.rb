def boasVindas
    puts "
 [][][] /""\ [][][]
  |::| /____\ |::|
  |[]|_|::::|_|[]|      Bem vindo ao
  |::::::__::::::|    Jogo da Adivinhação!
  |:::::/||\:::::|   
  |:#:::||||::#::|
 #%*###&*##&*&#*&##
##%%*####*%%%###*%*#
"
    puts
    puts "Insira seu nome:"
    nome = gets
    puts "\n\n"
    puts "Começaremos seu jogo agora, #{nome}"

    nome
end

def selecionaDificuldade
    puts "Qual o nível de difculdade?"
    puts "(1)Muito fácil (2)Fácil (3)Normal (4)Difícil (5)Impossível"
    dificuldade = gets.to_i
end

def sorteiaNumero(dificuldade)
    case dificuldade
    when 1
        maximo = 30
    when 2 
        maximo = 60
    when 3 
        maximo = 100
    when 4
        maximo = 150
    else
        maximo= 200
    end
    puts "Escolhendo um número secreto entre 1 e #{maximo}..."
    sorteado = rand(maximo)+1
    puts "Numero escolhido! Que tal tentar adivinhar?"
    puts "\n\n"
    sorteado
end

def pedeNumero(chutes, tentativa, limiteTentativas)
    puts "Tentativa #{tentativa.to_s} de #{limiteTentativas.to_s}"
    puts "Digite seu numero"
    puts "Chutes até agora: #{chutes.to_s}" 
    numeroChute = gets
    puts "Será que acertou? Seu chute foi #{numeroChute}"
    puts "\n\n"
    numeroChute.to_i
end

def verificaAcerto(numeroSecreto, chute) 
    acertou = numeroSecreto == chute

    if acertou 
        ganhou
        puts "\n\n"
        return true
    end

    maior = numeroSecreto > chute
    if maior
        puts "O número secreto é maior!"   
        puts "\n\n"
    else
        puts "O número secreto é menor!"
        puts "\n\n"
    end
    false
end

def ganhou
    puts "
                  .:.               
             .::::.             
..         ..::::::''::         
::::..  .::''''':::    ''.      
':::::::'         '.  ..  '.    
 ::::::'            : '::   :   
  :::::     .        : ':'   :  
  :::::    :::       :.     .'. 
 .::::::    ':'     .' '.:::: : 
 ::::::::.         .    ::::: : 
:::::    '':.... ''      '''' : 
':::: .:'              ...'' :  
 ..::.   '.........:::::'   :   
  '':::.   '::'':'':::'   .'    
        '..  ''.....'  ..'      
           ''........'

               Acertou!            "
end

def joga(nome,dificuldade)
    numeroSecreto = sorteiaNumero(dificuldade)

    pontos = 1000
    limiteTentativas = 5
    chutes = []

    for tentativa in 1..limiteTentativas
        chute = pedeNumero chutes, tentativa, limiteTentativas
        chutes << chute

        if nome.strip == "Luiz"
            ganhou
            puts nome
            break
        end

        pontosPerdidos = (chute - numeroSecreto).abs / 2.0
        pontos -= pontosPerdidos

        if verificaAcerto numeroSecreto, chute
            break
        end 
    end

    puts "Voce ganhou #{pontos} pontos."
end

nome = boasVindas
difculdade = selecionaDificuldade

def jogarNovamente
    puts "Deseja nogar novamente (S/N)"
    jogarNovamente = gets.strip
    jogarNovamente.upcase == "S"
end

loop do
    joga nome, difculdade
    if !jogarNovamente
        break
    end
end