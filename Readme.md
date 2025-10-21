# Sistema Judicial Guatemalteco en Neo4j

## Descripción general
Este repositorio contiene los archivos y el código fuente desarrollados para el proyecto de tesis titulado:  
**“Propuesta de modelado del sistema judicial guatemalteco mediante el uso de Neo4j: Relaciones entre Leyes, Delitos, Penas y Juzgados.”**

El objetivo del proyecto es representar las relaciones existentes entre **leyes, delitos, penas, juzgados y casos judiciales** utilizando una base de datos de grafos en **Neo4j**, con el fin de facilitar el análisis de patrones, redes delictivas y dinámicas judiciales en Guatemala.

## Contenido del repositorio

- **Casos.csv** → Contiene los datos de casos judiciales, incluyendo número de caso, sexo, edad, nacionalidad y departamento.  
- **Delitos.csv** → Contiene el listado de delitos codificados.  
- **Penas.csv** → Define los tipos de penas, rangos, unidades y observaciones.  
- **delito.cypher**, **pena.cypher**, **juzgado.cypher**, **consultas_escenarios.cypher** → Conjunto de consultas Cypher utilizadas para crear nodos, relaciones y escenarios de análisis dentro de Neo4j.  
- **main.py** → Script en Python encargado de automatizar la carga masiva de datos (casos) a la base de datos Neo4j. Permite procesar archivos extensos y dividirlos en lotes para su correcta importación.  


## Requisitos
Para ejecutar el proyecto localmente se necesita tener instalado:
- **Neo4j Desktop o AuraDB**
- **Python 3.9+**
- **Librerías:** `neo4j`, `pandas`

## Ejecución del script principal
1. Asegúrate de que la base de datos Neo4j esté activa.  
2. Configura las credenciales en el archivo `main.py` (URI y AUTH).  
3. Ejecuta el script con:
   ```bash
   python main.py
   ```
4. Los datos de los archivos `.csv` serán cargados automáticamente y se crearán los nodos y relaciones correspondientes.

## Consultas Cypher incluidas
Las consultas incluidas permiten:
- Crear y conectar nodos de **Delito**, **Pena**, **Juzgado** y **Caso**.  
- Analizar la frecuencia de delitos, distribución geográfica, tipo de fallo, y relaciones entre leyes y penas.  
- Generar visualizaciones interactivas mediante **Neo4j Bloom** o **NeoDash**.

## Créditos
Proyecto elaborado por **Jonatan Leonel García Arana**,  
como parte del trabajo de tesis en la **Universidad de San Carlos de Guatemala**,  
Facultad de Ingeniería, Escuela de Ciencias y Sistemas.
