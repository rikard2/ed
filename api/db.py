import psycopg2
from collections import namedtuple

class DB:
    def __init__(self):
        self.conn = psycopg2.connect(user="postgres", host="db", port="5432", database="db", password="db")

    def build_params(self, obj):
        params = []
        values = []
        for key in obj.keys():
            params.append(key + ' := ' + '%s')
            values.append(obj[key])

        str = ','.join(params);

        return  (str, values)

    def create_record(self, obj, fields):
        Record = namedtuple("Record", fields)
        mappings = dict(zip(fields, obj))
        return dict(Record(**mappings)._asdict())


    def query_one(self, query, *args):
        cur = self.conn.cursor()

        print('args', args)
        cur.execute(query, args)
        rows = cur.fetchone()
        self.conn.commit()

        return rows[0]

    def query_none(self, query, *args):
        cur = self.conn.cursor()

        print('args', args)
        cur.execute(query, args)
        self.conn.commit()

    def execute_query(self, query, params):
        cur = self.conn.cursor()

        cur.execute(query, (params))

        self.conn.commit()

    def execute_function(self, name, params, schema):
        cur = self.conn.cursor()

        str, values = self.build_params(params)
        sql = 'SELECT %s.%s (%s)' % (schema, name, str)
        cur.execute(sql, (values))

        rows = cur.fetchall()

        self.conn.commit()

        return rows

    def __getattr__(self,attr):
        return self.__get_global_handler(attr)

    def __get_global_handler(self, name):
        # Do anything that you need to do before simulating the method call
        handler = self.__global_handler
        handler.im_func.func_name = name # Change the method's name
        return handler

    def __global_handler(self, *args):
        function_name = self.__global_handler.im_func.func_name
        arguments = args[0] if len(args) > 0 else {}
        schema = args[1] if len(args) > 1 else 'public'
        return self.execute_function_results(function_name, arguments, schema)

    def execute_function_results(self, name, params, schema):
        cur = self.conn.cursor()

        str, values = self.build_params(params)
        sql = 'SELECT * FROM %s.%s(%s)' % (schema, name, str)
        cur.execute(sql, (values))

        rows = cur.fetchall()
        colnames = [desc[0] for desc in cur.description]

        self.conn.commit()
        result = []
        for row in rows:
            result.append(self.create_record(row, colnames))

        return result

    def execute_scalar_function(self, name, params, schema):
        rows = self.execute_function_results(name, params, schema)
        print(rows, flush=True)

        if len(rows) == 1:
            key = next(iter(rows[0]))
            return rows[0][key]

        return None

if __name__ == '__main__':
    db = DB()
