"""
In-Memories
"""

class Data:
    def __init__(self, table):
        self.table = table
        self.database = {}
        if not self.database.get(self.table):
            self.database[self.table] = {}

    def insert(self, key, value):
        self.database[self.table][key] = value
    
    def select(self,key):
        return self.database[self.table][key]