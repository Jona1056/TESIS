LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Jona1056/TESIS/main/Delitos.csv' AS row
WITH row
WHERE row.Delito IS NOT NULL AND row.juzgado IS NOT NULL

MERGE (d:Delito {nombre: row.Delito})
MERGE (l:Ley {nombre: row.tip_ley})
MERGE (d)-[r:REGULADO_POR]->(l)
SET r.capitulo = row.capítulo

WITH d, row
MATCH (j:Juzgado {nombre: row.juzgado})
MERGE (d)-[:ES_CONOCIDO_EN]->(j);
