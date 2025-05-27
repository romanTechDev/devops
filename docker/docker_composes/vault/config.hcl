storage "raft" {
    path = "./vault/data"
    node_id = "node1"
}

listener "tcp" {
    address = "vault-prod:8200"
    tls_disable = "true"
}

api_addr = "http://vault-prod:8200"
cluster_addr = "http://vault-prod:8201"
ui = true