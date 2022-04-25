# Data Definition Language
ddl = ["create"]

# Data Manipulation Language
dml = ["select", "insert"]

# Wildcard
wild = ["*"]

# Data Query Language
dql = ["from", "where", "limit"]

###########################################

class QueryExecutor(object):
    """Query -> Tokenize -> Tree -> Execute."""

    def run(query):
    	tokens = QueryParser(query)
		tree = QueryPlanner(tokens)
    	tree.execute()
