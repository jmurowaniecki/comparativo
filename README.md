Comparativo entre soluções
==========================

Este repositório visa explorar superficialmente as soluções mais comuns encontradas no mercado, desenvolvendo uma solução simples de ser replicada nos mais diversos ambientes.


Tecnologia | Versão       | Tamanho do container | Build |
-----------|--------------|----------------------|--------|
bash       | latest       | 14MB                 |        |
golang     | alpine       | 222MB                |        |
node       | 5-slim       | 180MB                |        |
perl       | 5-slim       | 180MB                |        |
php        | 5-slim       | 180MB                |        |
python     | 3-alpine     | 51.7MB               |        |
ruby       | 3-alpine     | 77.6MB               |        |

bash   | latest | 14MB |
golang | latest | 255MB |
php    | latest | 104MB |
perl   | latest | 180MB |
node   | latest | 141MB |
ruby   | latest | 80.2MB |
python | latest | 51.7MB |


# Teste de performance

A proposta de aplicação será o processamento de um arquivo contendo uma lista de 10 elementos divididos em dois conjuntos de dados, sendo o primeiro o valor do hash do dado e o segundo o dado em si.

A aplicação deve validar, calcular o hash correto para os inválidos e atualizar a lista de hashes, informando os inválidos.


bash       | latest       | 14MB                 | Utilizo em praticamente todos ambientes para as mais diversas funções, especialmente automação de processos.
golang     | alpine       | 222MB                | Utilizo quando preciso de performance e processamento, geralmente pra atividades que consomem mais recursos - como processamento gráfico, extrapolação de dados e paralelismo.
node       | 5-slim       | 180MB                | **Não utilizo**, apesar de gostar da linguagem, por motivos de necessitar de muitas bibliotecas e muitos requisitos para realizar atividades relativamente simples de processamento de dados.
perl       | 5-slim       | 180MB                | **Não utilizo**, apesar de gostar da linguagem, por motivos de necessitar de muitas bibliotecas e muitos requisitos para realizar atividades relativamente simples de processamento de dados.
php        | 5-slim       | 180MB                | **Não utilizo**, apesar de gostar da linguagem, por motivos de necessitar de muitas bibliotecas e muitos requisitos para realizar atividades relativamente simples de processamento de dados.
python     | 3-alpine     | 51.7MB               | Utilizo quando preciso processar resultados de extrapolação de dados, gerar relatórios e estou sem tempo (ou paciência) pra desenvolver uma solução em Go que já existe na comunidade Python.
ruby       | 3-alpine     | 77.6MB               | **Não uso** pois ser a proposta mais lenta e dificilmente escalável para quaisquer solução.
