MATCH (x)
DETACH DELETE x;


USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:////Users/bonifacio/Desktop/hackfest2017/pendurados-app/neo4j-community-3.2.0/import/cem.txt" AS row FIELDTERMINATOR '|' 
MERGE (unidadeGestora:UnidadeGestora {nome: row.cd_UGestora, id: row.cd_UGestora})
CREATE (pagamento:Pagamento {valor: row.vl_vantagens, mesano: row.dt_MesAnoReferencia}),
(unidadeGestora)-[:Pagou]->(pagamento),
(servidor:Servidor {cpf: row.cd_CPF, numero: row.no_Servidor}),
(servidor)-[:Recebeu]->(pagamento),
(cargo:Cargo {descricao: row.de_cargo, tipo: row.de_tipodocargo}),
(servidor)-[:TemCargo]->(cargo)


MATCH (unidadeGestora:UnidadeGestora)-[r:Pagou]->(p:Pagamento)
return unidadeGestora,r,p

MATCH (s:Servidor)-[r:TemCargo]->(c:Cargo)
return s,r,c

