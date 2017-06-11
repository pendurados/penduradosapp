MATCH (x)
DETACH DELETE x;


USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:////Users/bonifacio/Desktop/hackfest2017/pendurados-app/neo4j-community-3.2.0/import/cem.txt" AS row FIELDTERMINATOR '|' 
MERGE (unidadeGestora:UnidadeGestora {nome: row.cd_UGestora, id: row.cd_UGestora})
MERGE (servidor:Servidor {cpf: row.cd_CPF})
MERGE (cargo:Cargo {descricao: row.de_cargo})
MERGE (servidor)-[:TemCargo]->(cargo)
CREATE (pagamento:Pagamento {valor: row.vl_vantagens, mesano: row.dt_MesAnoReferencia}),
(unidadeGestora)-[:Pagou]->(pagamento),
(servidor)-[:Recebeu]->(pagamento)

MATCH (unidadeGestora:UnidadeGestora)-[r:Pagou]->(p:Pagamento)
return unidadeGestora,r,p

MATCH (s:Servidor)-[r:TemCargo]->(c:Cargo)
return s,r,c

