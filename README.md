Comparativo entre soluções
==========================

Este repositório visa explorar superficialmente as soluções mais comuns encontradas no mercado, desenvolvendo uma solução simples de ser replicada nos mais diversos ambientes.


Tecnologia | Versão                  | Versão | Tamanho do container | Tempo médio de build | Tempo médio de execução
-----------|-------------------------|--------|----------------------|----------------------|------------
golang     | Alpine Linux 3.19       | latest | 255MB                | 1.443s               | .790s
python     | Alpine Linux 3.19       | latest | 51.7MB               | 1.420s               | .756s
bash       | Alpine Linux 3.19       | latest | 14MB                 | 1.416s               | 5.536s
ruby       | Alpine Linux 3.19       | latest | 80.2MB               | 1.433s               | 1.066s
node       | Alpine Linux 3.19       | latest | 141MB                | 1.516s               | .766s
perl       | Debian GNU/Linux 12 n l | latest | 180MB                | 1.563s               | .706s
php        | Alpine Linux 3.19       | latest | 104MB                | 1.420s               | .763s



# Teste de performance

A proposta de aplicação será o processamento de um arquivo contendo uma lista de 10 elementos divididos em dois conjuntos de dados, sendo o primeiro o valor do hash do dado e o segundo o dado em si.

A aplicação deve validar, calcular o hash correto para os inválidos e atualizar a lista de hashes, informando os inválidos.

# Sobre as stacks


## Bash
Utilizo em praticamente todos ambientes para as mais diversas funções, especialmente automação de processos. Seja em Makefiles ou como soluções individuais.

## Go
Utilizo quando preciso de performance e processamento, geralmente pra atividades que consomem mais recursos - como processamento gráfico, extrapolação de dados e paralelismo.

## Node
Hoje (ao lado de Go e PHP) tem sido a ferramenta que mais tenho utilizado, seja em relação a microserviços ou front ou quaisquer ferramenta de automação onde o ambiente suporte devido a facilidade de desenvolvimento, imensidão de recursos e atividade da comunidade.

## Perl
**Não utilizo**, apesar de gostar da linguagem, por motivos de necessitar de muitas bibliotecas e muitos requisitos para realizar atividades relativamente simples de processamento de dados.

## PHP
Ainda é meu carro chefe (ao lado do NodeJS) em relação a trabalho. A maior parte dos clientes ainda chegam em mim por conta dessa stack - que diga-se de passagem tem melhorado consideravelmente nos últimos 5 anos.

## Python
Utilizo quando preciso processar resultados de extrapolação de dados, gerar relatórios e estou sem tempo (ou paciência) pra desenvolver uma solução em Go que já existe na comunidade Python.

## Ruby
**Não uso** (ou evito usar) pois ser a proposta mais lenta e dificilmente escalável para quaisquer solução.
