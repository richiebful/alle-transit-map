import pyodbc

def connect(connection_string: str):
    return pyodbc.connect(connection_string)