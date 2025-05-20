# 🚲 Sistema de Diagnóstico para Farol de Bicicleta a Dínamo

**Disciplina:** Inteligência Artificial  
**Professor:** Edjard Mota  
**Aluna:** Jessica de Figueredo Colares  
**Matrícula:** 22060036  
**Data de Entrega:** 19/05/2025  

---

## 📚 Descrição do Projeto
Implementação de um sistema de diagnóstico probabilístico para farol de bicicleta movido a dínamo utilizando **redes bayesianas** e programação lógica em ProbLog.

---

## 🔍 Questão 1 - Modelagem Teórica

### (a) Rede Bayesiana
```mermaid
graph TD
    Str --> R
    FIw --> R
    R --> V
    V --> Li
    B --> Li
    K --> Li

### (b) Tabelas de Probabilidade Condicional (CPTs)
Variável |    Valores                |    Probabilidades Base
Str      |    dry, wet, snow_covered |    0.6, 0.3, 0.1
FIw      |    ok, worn	             |    0.9, 0.1
B	     |    working, broken	     |    0.95, 0.05
K	     |    working, broken	     |    0.9, 0.1

### (c) Valores Plausíveis
Componentes elétricos com alta confiabilidade (90-95%)
Condições adversas (neve) aumentam probabilidade de falhas
Volante desgastado (10% de ocorrência)

### (d) Independência entre Str e Li
P(Li|V,R) = P(Li|V) \implies Li \perp\!\!\!\perp R | V

### (e) Resultado Calculado
P(V=t|Str=snow_covered) = 0.576
P(V=f|Str=snow_covered) = 0.424

## 💻 Questão 2 - Implementação em ProbLog
📂 Arquivo Principal
probabilidade.pl contém:

Todas as definições probabilísticas
Relações entre variáveis
Consultas pré-definidas

Principais Regras
% Probabilidades base
evento_prob(street, snow_covered, 0.1).
evento_prob(flywheel, worn, 0.1).

% Estado da luz
luz(ligada) :- 
    evento_prob(flywheel, ok, _),
    evento_prob(bulb, working, _),
    evento_prob(cable, working, _).

Como Executar
No SWISH ou ProbLog local:
?- consult('farol_bicicleta.pl').
?- consulta_prob(street, snow_covered, P).
