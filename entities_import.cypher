MATCH (x:Pagamento)
DETACH DELETE x;

MATCH (x:UnidadeGestora)
DETACH DELETE x;

MATCH (x:Servidor)
DETACH DELETE x;


USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:////Users/bonifacio/Desktop/hackfest2017/pendurados-app/neo4j-community-3.2.0/import/tres.txt" AS row FIELDTERMINATOR '|' 
CREATE (pagamento:Pagamento {valor: row.vl_vantagens, mesano: row.dt_MesAnoReferencia}),
(ug:UnidadeGestora {id: row.cd_UGestora, nome: row.de_ugestora}),
(ug)-[:Pagou]->(pagamento),
(servidor:Servidor {cpf: row.cd_CPF, numero: row.no_Servidor}),
(servidor)-[:Recebeu]->(pagamento)


MATCH (ug:UnidadeGestora)-[r:Pagou]->(p:Pagamento)
return ug,r,p

