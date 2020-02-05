#!/usr/bin/env python
# -*- coding: utf-8 -*-

from flask import Flask, request
from flask_restful import reqparse, Resource, Api
from flask_cors import CORS
from db import DB

app = Flask(__name__)
cors = CORS(app, resources={r"/*": {"origins": "*"}})

api = Api(app)

parser = reqparse.RequestParser()
parser.add_argument('params')
print("Starting up API...")
class Employees(Resource):
    def get(self, function_name):
        print("getting...", function_name)
        db = DB()
        x = db.execute_function_results(function_name, {}, 'public')

        return x, 200, {'Access-Control-Allow-Origin': '*'}

    def post(self, function_name):
        print(request, flush=True)
        data = request.get_json(force=True)
        print('data', function_name, data, flush=True)
        db = DB()
        req = {}
        for key in data.keys():
            req[key] = data[key]

        print('req', function_name)
        x = db.execute_function_results(function_name, req, 'public')

        return x, 200, {'Access-Control-Allow-Origin': '*'}

class Scalar(Resource):
    def post(self, function_name):
        data = request.get_json(force=True)
        print('data', function_name, data, flush=True)
        db = DB()
        req = {}
        for key in data.keys():
            req[key] = data[key]

        print('req', function_name)
        x = db.execute_scalar_function(function_name, req, 'public')

        return x, 200, {'Access-Control-Allow-Origin': '*'}

class Single(Resource):
    def post(self, function_name):
        print(request, flush=True)
        data = request.get_json(force=True)
        print('data', function_name, data, flush=True)
        db = DB()
        req = {}
        for key in data.keys():
            req[key] = data[key]

        print('req', function_name)
        x = db.execute_function_results(function_name, req, 'public')

        return x[0], 200, {'Access-Control-Allow-Origin': '*'}

api.add_resource(Employees, '/<function_name>')
api.add_resource(Scalar, '/scalar/<function_name>')
api.add_resource(Single, '/single/<function_name>')


if __name__ == '__main__':
     app.run(host="0.0.0.0", port='5002')
