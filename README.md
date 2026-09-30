# Portafolio Académico · David Martínez

Versión visual futurista y funcional. Abre `index.html` con Google Chrome.

Las 16 semanas incluyen 32 archivos HTML de plantilla para que **Ver actividad** funcione desde el inicio. Las evidencias están optimizadas en formato WebP dentro de `actividades/semana-XX/img1/` e `img2/`.

## Subir a GitHub

1. Sube el contenido de esta carpeta al repositorio (el archivo `index.html` debe quedar en la raíz).
2. No vuelvas a agregar archivos ZIP dentro del repositorio: la carpeta `actividades/` ya contiene todo lo necesario.
3. Para publicarlo, entra a **Settings → Pages**, selecciona la rama principal y la carpeta `/ (root)`.

Las plantillas también aceptan evidencias nuevas en PNG, JPG o WebP. Para mantener el repositorio liviano, usa WebP para capturas de pantalla.

## Agregar evidencias a otra semana

Cada semana tiene dos actividades:

- Actividad 1: coloca sus imágenes dentro de `img1/`.
- Actividad 2: coloca sus imágenes dentro de `img2/`.

Por ejemplo, para la semana 05:

```text
actividades/
└── semana-05/
    ├── actividad-1.html
    ├── actividad-2.html
    ├── img1/
    │   ├── evidencia-1.webp
    │   └── evidencia-2.webp
    └── img2/
        ├── evidencia-1.webp
        └── evidencia-2.webp
```

Los nombres deben comenzar en `evidencia-1`, continuar en orden y usar una extensión compatible: `.webp`, `.png`, `.jpg` o `.jpeg`. Después de agregar las imágenes, abre la actividad correspondiente y aparecerán automáticamente en la galería.


## Marcar actividades entregadas

En `index.html` busca la lista `entregadas` (cerca del final) y agrega la semana y sus actividades. Por ejemplo, al terminar la semana 04:

```js
const entregadas={1:[1,2],2:[1,2],3:[1,2],4:[1,2]};
```

El progreso, los contadores por unidad y el estado "Completada" se actualizan solos.

## Semana 03

`actividades/semana-03/` incluye los Word, los PDF y las infografías de la Actividad 1 (Grados y Títulos) y la Actividad 2 (CadenaEditorial y EmpresaMaterialInformatica).
