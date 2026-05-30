# Ferretería API - ASP.NET Core 8 + SQL Server

API REST desarrollada con ASP.NET Core 8 y SQL Server para la gestión de una ferretería.

El proyecto permite administrar categorías, productos y registrar movimientos relacionados con el inventario.

## Tecnologías Utilizadas

* ASP.NET Core 8
* Entity Framework Core
* SQL Server
* Swagger / OpenAPI
* Dependency Injection
* C#

---

## Características

### Categorías

* Listar categorías
* Obtener cantidad de categorías registradas
* Agregar categorías
* Eliminar categorías

### Productos

* Listar productos
* Obtener cantidad de productos
* Agregar productos
* Actualizar productos
* Eliminar productos

### Movimientos

* Consultar historial de movimientos
* Obtener cantidad de movimientos registrados
* Filtrar movimientos por tipo

---

## Estructura del Proyecto

```text
Ferreteri/
│
├── Controllers/
├── Models/
├── Services/
├── Data/
├── appsettings.json
├── Program.cs
└── README.md
```

---
## DIAGRAMA BD
<img width="682" height="528" alt="image" src="https://github.com/user-attachments/assets/83e09512-2e4f-4494-93b8-f09d19e9b74f" />

---

## Requisitos

* .NET 8 SDK
* SQL Server
* Visual Studio 2022 o VS Code

---

## Configuración de Base de Datos

El script de creación de la base de datos se encuentra incluido en el repositorio : BDScript.sql

1. Abrir SQL Server Management Studio.
2. Ejecutar el script SQL incluido.
3. Verificar que la base de datos se haya creado correctamente.

---

## Configuración de la Cadena de Conexión

Editar el archivo:

```json
appsettings.json
```

Ejemplo:

```json
{
  "ConnectionStrings": {
    "CadenaSQL": "Server=SERVIDOR;Database=FERRETERI;Trusted_Connection=True;TrustServerCertificate=True;"
  }
}
```

---

## Ejecución

Restaurar dependencias:

```bash
dotnet restore
```

Compilar:

```bash
dotnet build
```

Ejecutar:

```bash
dotnet run
```

---

## Swagger

Una vez iniciada la aplicación, acceder a:

```text
https://localhost:{puerto}/swagger
```

Desde Swagger se pueden probar todos los endpoints disponibles.

---

## Endpoints Disponibles

### Categorías

| Método | Endpoint                    |
| ------ | --------------------------- |
| GET    | /api/Categorias/listar      |
| GET    | /api/Categorias/count       |
| POST   | /api/Categorias/add         |
| DELETE | /api/Categorias/remove/{id} |

---

### Productos

| Método | Endpoint                   |
| ------ | -------------------------- |
| GET    | /api/Productos/listar      |
| GET    | /api/Productos/count       |
| POST   | /api/Productos/add         |
| PUT    | /api/Productos/update      |
| DELETE | /api/Productos/remove/{id} |

---

### Movimientos

| Método | Endpoint                     |
| ------ | ---------------------------- |
| GET    | /api/Movimientos             |
| GET    | /api/Movimientos/count       |
| GET    | /api/Movimientos/tipo/{tipo} |

---

## Registro de Movimientos

La API registra movimientos relacionados con los productos para mantener un historial de cambios realizados en el inventario.

Ejemplos:

* Creación de productos
* Actualización de productos
* Eliminación de productos

---

## Autor

Proyecto desarrollado como práctica de ASP.NET Core Web API y SQL Server.
