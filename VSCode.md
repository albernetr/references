# Comandos

## Abrir paleta de comandos
F1 o ctrl+ shift + p

## Cambiar o reestablecer la configuracion de usuarios
f1 --> "Settings" --> opc "Open User Settings (JSON)"

## Confugacion o cahce de VSCode
C:\Users\<usuario>\AppData\Roaming\Code

## hacer que una linea se adapte al contenido de la ventana
f1 --> "Settings" --> opc "Toggle Word Wrap"

# Extensiones VSCode

- indent-rainbow (Muestra la identacion del codigo)
- Live server (Levanta un servidor html virtual)
- Angular Language Service
- Angular Snippets
- Angular Schematics
- Angular 2 Inline
- Auto Close Tag
- Auto import
- Auto Rename Tag
- Error Lens
- Paste JSON as Code
- TypeScript Importer - optional
- Editor Config for VSCode
- Better Comments
- Tailwind CSS IntelliSense
- Pretty TypeScript Errors
- JavaScript and TypeScript Nightly

# Extensiones Chrome
- Angular DevTools
- Json Viewer Awesome


# Utilidades

  - linked edit
 
# Atajos de teclado

  - ctrl + g (ir a linea)
  - shift + alt + direccional arriba o abajo (duplica la linea donde esta el cursor)
  - ctrl + shift + k (elimina linea del cursor)
  - ctrl + o (abrir archivo)
  - ctrl +f (buscar en el editor)
  - ctrl + shift +f (buscar en el texto en cualquier archivo, utilizando el buscador en archivo de la barra lateral)
  - ctrl + k +c (comentarea la linea o lineas seleccionadas)
  - alt + fecha arriba/abajo (mueve la linea de lugar)
  - F12 (permite ver la definicion de la comando/propiedad sobre la que esta el cursor)
  - ctrl + alt + flecha abajo (crea multiples cursores)
  - alt + clic (permite crear multiples cursores en columnas deferentes de filas diferentes)
  - ctrl + shift + l (Permite modificar el texto en todas las apariciones que exista el texto seleccionado)
  - ctrl + shift + teclas al lado del cero (Expanden o contraen el bloque de codigo)
  - ctrl + k, z (zenmode - ocultatodos los elementos y solo muestra la ventana del editor de texto, se regresa a pantalla normal con F11. se puede personalizar desde configuracion de usuario)
  - ctrl + shift + m (abre el editor de problemas)
  - ctrl + h (habre la utilidad de reemplazar)

  Personalizar atajos de teclado F1 -> "Open Keyboard Shortcuts

# Snipped

F1 -> "Snippets: Configure Snippets" -> Seleccionar lenguaje

```powershell
{
  "nombre funcionalidad a presentar": {
      "prefix": "nombre_emet",
      "body": [
        // codigo a insertar
        "Console.Wrhite($1:nombre_guia_parametro)",
        "$2"
      ],
      "description": "Descripción de la función"
  }
}
```

- configuracion en usersetting para que los snippets se muestren de primeros 
"snippets.sugestion": "top"
- Ruta de los snippets: <user>/AppData/Toaming/User/Snippets


# EMMET

- ul>li - Crea una etiqueta ul y dentro del ul un li
- ul>li*4>a crea un ul con 4 li que contienen un a
- ul>(li>a)*4 Crea primero el ul, luego el li con la a adentro y lo repite 4 veces. Da el mismo resultado del anterior, pero la contruccion interna es diferente.
- ul.link Agrega la clase link al elemento ul
- ul#link Asingna el id link al ul
- ul{contenido} agrega el contenido dentro de las llaves al contenido del ul
- ul>li*4{contenido $} al contenido lo numera en orden del 1 al 4

# Github Copilot

## Paso 1 — Confirmar que Copilot está autenticado en VS Code
Verificar que tu sesión de Copilot dentro del IDE está sana.
- Abre la paleta de comandos: Ctrl + Shift + P
- Luego ejecuta: GitHub Copilot: Status
- Si no está autenticado, ejecutar: GitHub Copilot: Sign In

## Paso 2 — Abrir Copilot Chat y verificar Agent Mode

Comprobar que no estás solo en “chat básico”, sino que tienes disponible el modo agente en el IDE.
- En la paleta de comandos: Ctrl + Shift + P
- Ejecuta: Chat: Open Chat
- Luego revisa en el panel derecho si puedes seleccionar un modo como: Ask, Edit, Agent, Plan. Un flujo experto típico es: Plan → Ask → Agent → Edit → Validate.

## Paso 3 — Activar el uso de instruction files
Asegurarnos de que Copilot va a leer instrucciones persistentes del proyecto.
- Abre Settings en VS Code: Ctrl + ,
- En la caja de búsqueda escribe: instruction file
- Luego verifica que esté activada la opción equivalente a: Code Generation: Use Instruction Files.
GitHub documenta que las custom instructions para Copilot Chat pueden habilitarse o deshabilitarse desde el IDE buscando instruction file en Settings.

*Por qué hacerlo:* Sin esto, puedes crear archivos de instrucciones y pensar que Copilot los está usando cuando en realidad no los está leyendo.
*Cómo verificar:* La opción debe quedar marcada/activa




  
  
