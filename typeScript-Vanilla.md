# Creación Vanilla con vite
npm create vite@latest

# Ejecutar o levantar el servicio
npm run dev

# Creacion de constantes
const  \<name\>: \<data-type\> = \<value\>;

```
 const name:string = 'Leon';
 const edad:number = 65;

```

# Creacion de Variables
let  \<name\>: \<data-type\> [= \<value\>];

```
 let name:string = 'Leon';
 let edad:number ;

```
# Creacion de Variables con multiples tipos o valores damisibles.

let  \<name\>: \<data-type\> | \<data-type1\>  [= \<value\>];

let  \<name\>: \<data-type\> | \<value\>  [= \<value\>];

let  \<name\>: \<value\> | \<value_1\> | \<value_n\>   [= \<value\>];

```
 let name: string | number = 'Leon';
 let edad: number | 'Full' ;

 edad= 'Full';
 edad = 'Full';
 edad= 25;
 edad = 'Test'; //error porque no esta dentro de los tipos permitidos

```


# `export` en TypeScript

## 📌 ¿Para qué sirve `export`?

La palabra clave `export` en TypeScript (y JavaScript moderno) se usa para **exponer funciones, clases, interfaces, constantes u objetos** desde un módulo, permitiendo que sean utilizados en otros archivos mediante `import`.

---

## 🧩 Tipos de exportaciones

### 1. **Exportación nombrada**
Permite exportar múltiples elementos individualmente.

```ts
// archivo: mathUtils.ts
export const PI = 3.1416;

export function sumar(a: number, b: number): number {
  return a + b;
}

export class Calculadora {
  multiplicar(x: number, y: number): number {
    return x * y;
  }
}











