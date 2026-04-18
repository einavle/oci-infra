from google.cloud import bigquery

class BQ:
    def setdata(self, json_payload):
        '''
        json_payload is expected to be a simple json with no nested layers
        The first key value pair are expected to have the tabe full path in the value
        The rest key value pairs are expected to have the name of the field in the key and its value in the value
        for instace sample payload:
        {
            "table-name" : "monitoringdwh.einav_test.ci_jobs",
            "start_time" : "2023-01-01 10:00:00", 
            "name" : "job2", 
            "status" : "fail"
        }
        '''
        
        
        client = bigquery.Client()
        tuples = [(k, v) for k, v in json_payload.items()]
        table_name=tuples[0][1]
        row=dict(tuples[1:]) 
        errors = client.insert_rows_json(table_name, [row])  
        if errors == []:
            print(f'Success! new row added to {table_name}: {row}')
            return f'Success! new row added to {table_name}: {row}'
        else:
            print(f'Encountered errors while inserting rows: {errors}')
            return f'Encountered errors while inserting rows: {errors}'


    def tryit(self):
        l=[]
        client = bigquery.Client()
        query = """
            SELECT * FROM `monitoringdwh.einav_test.ci_jobs` LIMIT 1000
            """
        query_job = client.query(query)  
        for row in query_job:
            l.append(str(row))
        print(' '.join(l))
        ret='<br>'.join(l)
        return f'<p><b>Big Query Sender Sample Table:</b><br>{ret}</p>'

if __name__ == "__main__":
    BQ().tryit()



