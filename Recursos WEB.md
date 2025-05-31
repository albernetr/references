# Estructuras de datos
En esta pagina de la unversidad de sanfrancisco se encuentra un conjunto de animaciones que permiten entender como funcionan las estructuras de datos.

https://www.cs.usfca.edu/~galles/visualization/

# Curso IA
## Vector ordenado 
Algoritmo (Insercion).

1 - Ordenar el vector si no esta ordenado
2 - Encontrar la posicion donde el siguiente elemento es mayor al elemento que se desea insertar 
3 - Mover todos los elementos una posicion a la derecha de atras hacia adelante hasta llegar a la posicion encontrada. Importante mover tambien la posicion encontrada. (se asume que el vector esta ordenado de forma ascendente)

vector[posicion_actual + 1] = vactor[posicion_actual]
4 - Insertar el nuevo elemento en la posicion encontrada



https://colab.research.google.com/drive/1PjhBYD1jeB1wFeO96y6MMxIFSsmb8LT3?usp=sharing#scrollTo=ilKOzbksUosx

## Grafo
https://colab.research.google.com/drive/1qCMZWL56v0wj2g-se5fijJ4gawbIvSwY?usp=sharing

## 🔍 Formalización de Búsqueda Golosa y A*

### 1. Definiciones básicas

Sea un grafo dirigido o no dirigido \( G = (V, E) \), donde:
- \( V \) es el conjunto de nodos (vértices),
- \( E \subseteq V \times V \) es el conjunto de aristas (conexiones entre nodos).

Sean:
- \( A \in V \): nodo de inicio.
- \( Z \in V \): nodo objetivo.
- \( X \subseteq V \): conjunto de nodos adyacentes a un nodo \( n \in V \), es decir:
  \[
  X = \{ x \in V \mid (n, x) \in E \}
  \]

### 2. Funciones de evaluación

Para cada nodo \( x \in V \), se definen las siguientes funciones:

- \( g(x) \): Costo real acumulado desde el nodo inicial \( A \) hasta el nodo \( x \).
- \( h(x) \): Heurística. Estimación del costo restante desde \( x \) hasta el nodo objetivo \( Z \).
- \( f(x) = g(x) + h(x) \): Función de evaluación total.

### 3. Criterios de selección

- **Búsqueda Golosa** (Greedy Best-First Search):
  \[
  \text{Seleccionar } x \in X \text{ tal que } h(x) \text{ sea mínimo}.
  \]

- **Algoritmo A\***:
  \[
  \text{Seleccionar } x \in X \text{ tal que } f(x) = g(x) + h(x) \text{ sea mínimo}.
  \]

### 4. Consideraciones

- Una heurística \( h(x) \) se considera **admisible** si nunca sobreestima el costo real restante.
- En A\*, si la heurística es **consistente (monótona)**, se garantiza la optimalidad del camino encontrado.
- El éxito de la búsqueda depende en gran medida del diseño contextual de las funciones \( g \) y \( h \) para el dominio particular.

---

## 🧪 Ejemplo aplicado: Búsqueda desde Arad hacia Bucarest

Supongamos un grafo de ciudades con las siguientes conexiones y distancias reales:

[Arad] ---140---> [Sibiu] ---99---> [Fagaras] ---211---> [Bucarest]


Y se tienen las siguientes heurísticas (estimaciones en línea recta hacia Bucarest):

- \( h(\text{Arad}) = 366 \)
- \( h(\text{Sibiu}) = 253 \)
- \( h(\text{Fagaras}) = 178 \)
- \( h(\text{Bucarest}) = 0 \)

### Aplicación en Búsqueda Golosa

Desde Arad, se evalúan los vecinos:
- Sibiu: \( h = 253 \)

Como es el único adyacente, se elige Sibiu. Luego:
- Fagaras: \( h = 178 \)
- Se elige Fagaras, y de ahí Bucarest.

**Orden de visita:** Arad → Sibiu → Fagaras → Bucarest

### Aplicación en A*

Se calcula \( f(x) = g(x) + h(x) \):

- Desde Arad, \( g(\text{Sibiu}) = 140 \), \( h = 253 \), entonces \( f = 393 \)
- Desde Sibiu, \( g(\text{Fagaras}) = 140 + 99 = 239 \), \( h = 178 \), entonces \( f = 417 \)
- Desde Fagaras, \( g(\text{Bucarest}) = 239 + 211 = 450 \), \( h = 0 \), entonces \( f = 450 \)

**Orden de expansión:** Se elige siempre el nodo con menor \( f(x) \) hasta llegar a Bucarest.

Este ejemplo muestra cómo la combinación entre costo real y estimación influye en la eficiencia y precisión del camino seleccionado.

---

