LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Jona1056/TESIS/main/Penas.csv' AS row
WITH row
WHERE row.Delito IS NOT NULL AND row.Cod IS NOT NULL

MATCH (d:Delito {nombre: row.Delito})
MERGE (p:Pena {cod: row.Cod})
SET
  p.unidad_pena = row.unidad,
  p.moneda_multa = row.Moneda,
  p.observacion = row.Observacion

FOREACH (_ IN CASE WHEN row.pena_min IS NOT NULL AND row.pena_min <> "" THEN [1] ELSE [] END |
  SET p.pena_min = toFloat(row.pena_min)
)

FOREACH (_ IN CASE WHEN row.pena_max IS NOT NULL AND row.pena_max <> "" THEN [1] ELSE [] END |
  SET p.pena_max = toFloat(row.pena_max)
)

FOREACH (_ IN CASE WHEN row.mul_min IS NOT NULL AND row.mul_min <> "" THEN [1] ELSE [] END |
  SET p.multa_min = toFloat(row.mul_min)
)

FOREACH (_ IN CASE WHEN row.mul_max IS NOT NULL AND row.mul_max <> "" THEN [1] ELSE [] END |
  SET p.multa_max = toFloat(row.mul_max)
)

MERGE (d)-[r:TIENE_PENA]->(p)
SET r.tipo = row.PENA;
