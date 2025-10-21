UNWIND [
  'Juzgado de Primera Instancia',
  'Juzgado de Mayor Riesgo',
  'Juzgado de Paz Penal',
  'Juzgado de Paz Móvil',
  'Juzgado de Mayor Riesgo o Juzgado de Primera Instancia Penal (según el delito conspirado)'
] AS nombre
MERGE (:Juzgado {nombre: nombre});