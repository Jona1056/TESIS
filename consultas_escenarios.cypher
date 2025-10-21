// Consulta Cypher para obtener casos por tipo de delito y departamento
// Buscar $delito en el departamento de $departamento
MATCH (c:Caso)-[r:RELACIONADO_CON]->(d:Delito)
WHERE d.nombre = $delito AND c.departamento = $departamento
RETURN c, d, r

// Consulta Cypher para obtener casos por tipo de fallo y departamento
// Buscar casos con resultado $fallo en el departamento de $departamento
MATCH (c:Caso)-[r:RELACIONADO_CON]->(d:Delito)
WHERE r.resultado = $fallo AND c.departamento = $departamento
RETURN c, d, r

// Consulta Cypher para obtener los delitos regulados por una ley específica
// Buscar delitos regulados por $ley
MATCH (d:Delito)-[r:REGULADO_POR]->(l:Ley)
WHERE l.nombre CONTAINS $ley
RETURN d, r, l



//  Buscar delitos con pena máxima mayor a $valor.
// Consulta Cypher para obtener delitos con pena máxima mayor a un valor específico
MATCH (d:Delito)-[r:TIENE_PENA]->(p:Pena)
WHERE p.pena_max > $valor
RETURN d, r, p


// Buscar el delito $delito cometido por personas $edad en el departamento de $departamento
// Consulta Cypher para obtener delitos cometidos por personas mayores o menores de edad en un departamento específico
MATCH (c:Caso)-[r:RELACIONADO_CON]->(d:Delito)
WHERE d.nombre = $delito AND c.edad = $edad AND c.departamento = $departamento
RETURN c, d, r


// Buscar todo sobre el caso número %num
// Consulta Cypher para visualizar toda la estructura judicial de un caso mediante su identificador
MATCH (c:Caso {num: $num})-[r1:RELACIONADO_CON]->(d:Delito)
MATCH (d)-[r2:REGULADO_POR]->(l:Ley)
MATCH (d)-[r3:TIENE_PENA]->(p:Pena)
MATCH (d)-[r4:ES_CONOCIDO_EN]->(j:Juzgado)
RETURN c, r1, d, r2, l, r3, p, r4, j