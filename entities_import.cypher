MATCH (x:Pagamento)
DETACH DELETE x

MATCH (x:UnidadeGestora)
DETACH DELETE x


USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:////Users/bonifacio/Desktop/hackfest2017/pendurados-app/neo4j-community-3.2.0/import/tres.txt" AS row FIELDTERMINATOR '|' 
CREATE (p:Pagamento {valor: row.vl_vantagens, mesano: row.dt_MesAnoReferencia}),
(ug:UnidadeGestora {id: row.cd_UGestora, nome: row.de_ugestora}),
(s:Servidor {}),
(ug)-[:Pagou]->(p)


USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:////Users/bonifacio/Desktop/hackfest2017/pendurados-app/neo4j-community-3.2.0/import/tres.txt" AS row FIELDTERMINATOR '|' 
MATCH (p:Pagamento), (ug:UnidadeGestora)
CREATE (ug)-[:Pagou]->(p)

MATCH (ug:UnidadeGestora)-[r:Pagou]->(p:Pagamento)
return ug,r,p