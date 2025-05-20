# 💡 Trabalho 2 - Sistema Probabilístico para Farol de Bicicleta

**Disciplina:** Inteligência Artificial  
**Professor:** Edjard Mota  
**Aluna:** Jessica de Figueredo Colares  
**Matrícula:** 22060036  
**Data de Entrega:** 19/05/2025  

---

## 📋 Descrição do Projeto
Implementação de um sistema de diagnóstico para um farol de bicicleta movido a dínamo utilizando **redes bayesianas**. O modelo foi desenvolvido em **ProbLog** e aborda as relações probabilísticas entre os componentes do sistema.

---

## ✏️ Questão 1 - Modelagem da Rede Bayesiana

### 🔹 (a) Rede de Causalidade
```mermaid
graph TD
    Str --> R
    FIw --> R
    R --> V
    V --> Li
    B --> Li
    K --> Li

🔹 (b) Tabelas de Probabilidade Condicional (CPTs)
Variável	Condição	Valores
Str	-	dry: 0.6, wet: 0.3, snow_covered: 0.1
FIw	-	t: 0.1, f: 0.9
R	Str, FIw	Valores definidos no código
V	R	t: 0.8 (R=t), 0.1 (R=f)
B	-	t: 0.95, f: 0.05
K	-	t: 0.9, f: 0.1
Li	V,B,K	t: 0.99 (V=t,B=t,K=t), f: outros casos
🔹 (c) Justificativa dos Valores
Rua com neve aumenta probabilidade de deslizamento (R)

Volante desgastado (FIw) aumenta chance de R

Componentes elétricos (B e K) com alta confiabilidade

Tensão (V) mais provável quando dínamo desliza

🔹 (d) Independência entre Str e Li
P(Li|V,R) = P(Li|V) \implies Li \perp\!\!\!\perp R | V

🔹 (e) Cálculo P(V|Str=snow_covered)
Resultado da implementação:

P(V=t) = 0.58

P(V=f) = 0.42

💻 Questão 2 - Implementação em ProbLog
📂 Arquivo Principal
bike_light.pl contém:

Definição completa da rede bayesiana

Todas as CPTs com valores

Consultas para cálculo de probabilidades

🔍 Solução para 1(e)
evidence(street(snow_covered)).
query(v(t)).  % Retorna 0.58
query(v(f)).  % Retorna 0.42

🚀 Como Executar
Online: Use SWISH ProbLog

Local: Instale ProbLog e execute:
problog bike_light.pl

📌 Observações
Os valores podem variar ligeiramente dependendo da implementação

Verifique o arquivo PDF anexo para detalhes do enunciado

