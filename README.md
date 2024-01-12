Comparativo entre soluções
==========================

Este repositório visa explorar superficialmente as soluções mais comuns encontradas no mercado, desenvolvendo uma solução simples de ser replicada nos mais diversos ambientes.

Stack  | Docker image        | Version | Size   | Build | 1º exec. | Σ execs | Count
-------|---------------------|---------|--------|:-----:|:--------:|:-------:|:-----:
golang | Alpine Linux 3.19   | latest  | 255MB  | 1.800 | .71      | .680    | 3
python | Alpine Linux 3.19   | latest  | 51.7MB | 1.700 | .66      | .676    | 3
bash   | Alpine Linux 3.19   | latest  | 14MB   | 1.700 | 5.53     | 5.543   | 3
ruby   | Alpine Linux 3.19   | latest  | 80.2MB | 1.720 | .74      | .736    | 3
node   | Alpine Linux 3.19   | latest  | 141MB  | 1.700 | .73      | .733    | 3
perl   | Debian GNU/Linux 12 | latest  | 180MB  | 1.700 | .64      | .640    | 3
php    | Alpine Linux 3.19   | latest  | 104MB  | 1.700 | .68      | .680    | 3




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

## Sobre o Makefile
Utilizo em absolutamente **todos** meus projetos e praticamente todos os projetos em que tenho automomia
para criar e incluir rotinas de qualidade de software, instalação e configuração de ambiente, etc.
