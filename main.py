from neo4j import GraphDatabase
import pandas as pd


URI = "URL"
AUTH = ("usuario", "password")
CSV_PATH = "Casos.csv"
BATCH_SIZE = 1000
#c30b6f3b
QUERY = """
UNWIND $batch AS row
MATCH (d:Delito {nombre: row.delito_cod})
MERGE (c:Caso {num: row.num})
SET
  c.sexo = row.sexo,
  c.edad = row.edad,
  c.nacionalidad = row.nacionalidad,
  c.departamento = row.departamento
MERGE (c)-[r:RELACIONADO_CON]->(d)
SET
  r.año = row.año,
  r.mes = row.mes,
  r.resultado = row.tip_fallo,
  r.rol = row.involucramiento
"""

def load_cases():
    df = pd.read_csv(CSV_PATH)
    df = df.dropna(subset=["núm_corre", "delito_cod"])

    df.rename(columns={
        "núm_corre": "num",
        "año_reg": "año",
        "mes_reg": "mes",
        "men_may": "edad",
        "depto_reg": "departamento"
    }, inplace=True)

    driver = GraphDatabase.driver(URI, auth=AUTH, connection_timeout=300000)

    with driver.session() as session:
        for i in range(80, len(df), BATCH_SIZE):
            batch = df.iloc[i:i + BATCH_SIZE]
            data = batch.to_dict(orient="records")
            session.run(QUERY, batch=data)
            print(f"✅ Batch {i // BATCH_SIZE + 1} ({len(batch)} filas) cargado.")

    driver.close()

load_cases()
