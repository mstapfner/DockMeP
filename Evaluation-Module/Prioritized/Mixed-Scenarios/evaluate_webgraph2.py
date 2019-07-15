import matplotlib.pyplot as plt
from influxdb import InfluxDBClient
import array as arr
from datetime import datetime
import sys
sys.path.insert(0, '../../')
from query_data_functions import *

def main(host='5.189.144.254', port=8086):
    """Instantiate a connection to the InfluxDB."""
    user = 'admin'
    password = 'os234guivahdf1a'
    dbname = 'remoteInstance'
    client = InfluxDBClient(host, port, user, password, dbname)

    """Plot Generation"""

    """CPU Usage Plot Generation"""
    plt.figure(num='CPU Usage Web-Graph-Benchmark 2', figsize=(14, 10), dpi=100, facecolor='w', edgecolor='k')

    # plotting the first in-memory benchmark
    query = 'SELECT value FROM "container_cpu_user_seconds_total" WHERE "name" = \'graphanalyticsweb21prio\';'
    xresult, yresult = queryCPUUtil(client, query)
    plt.plot(xresult, yresult, label = "CPU Usage of the Graph-Analytic Benchmark 1", color = "red",linewidth=7.0)
    query = 'SELECT value FROM "container_cpu_user_seconds_total" WHERE "name" = \'graphanalyticsweb22prio\';'
    xresult, yresult = queryCPUUtil(client, query)
    plt.plot(xresult, yresult, label = "CPU Usage of the Graph-Analytic Benchmark 2", color = "blue",linewidth=7.0)

    plt.gcf().autofmt_xdate()
    plt.grid()

    # Naming the x axis
    plt.xlabel('Timestamps')
    # naming the y axis
    plt.ylabel('CPU Usage in %')
    # give a title
    plt.title('CPU Usage Web-Graph Scenario 2')
    # show legend on plot
    plt.legend()
    # save as image
    plt.savefig('./gen_images/cpu_web_graph2.png')


    """Memory Usage Plot generation"""
    plt.figure(num='Memory Usage Web-Graph-Benchmar 2k', figsize=(14, 10), dpi=100, facecolor='w', edgecolor='k')

    # plotting the Streaming Server
    query = 'SELECT * FROM "container_memory_usage_bytes" WHERE "name" = \'graphanalyticsweb21prio\';'
    memXServer, memYServer = queryMemoryUsage(client, query)
    plt.plot(memXServer, memYServer, label = "Memory Usage of the Graph-Analytic Benchmark 1 while running Web-Benchmark", color="red",linewidth=7.0)
    query = 'SELECT * FROM "container_memory_usage_bytes" WHERE "name" = \'graphanalyticsweb22prio\';'
    memXServer, memYServer = queryMemoryUsage(client, query)
    plt.plot(memXServer, memYServer, label = "Memory Usage of the Graph-Analytic Benchmark 2 while running Web-Benchmark", color="blue",linewidth=7.0)

    plt.gcf().autofmt_xdate()

    # naming the x axis
    plt.xlabel('Timestamps')
    # naming the y axis
    plt.ylabel('Memory Usage in %')
    # give a title
    plt.title('Memory Usage Web-Graph Scenario 2')
    # show legend on plot
    plt.legend()
    # save as Image
    plt.savefig('./gen_images/mem_web_graph2.png')

    plt.grid()


    """HTTP Requsts Plot Generation"""
    """
    # New Client because of other database
    user = 'admin'
    password = 'os234guivahdf1a'
    dbname = 'webgraph2prio'
    client = InfluxDBClient(host, port, user, password, dbname)

    # Get Requests from InfluxDB
    requests10 = getRequestsDf(client, "10s")

    # Request duraition
    yresult = requests10["requests_duration_percentile_95"]
    # Amount of requests
    xresult = requests10["requests"]

    # Transformation of arrays
    yresult = removeNan(yresult)
    xresult = calcSumFromRow(xresult)

    plt.figure(num='Request duration of 95% of the requests', figsize=(14, 10), dpi=100, facecolor='w', edgecolor='k')
    plt.plot(xresult, yresult, label = "Request duration of 95% of the requests", color = "red",linewidth=7.0)

    plt.gcf().autofmt_xdate()

    # Naming the x axis
    plt.xlabel('Amount of requests sent')
    # naming the y axis
    plt.ylabel('Duration in milliseconds')
    # give a title
    plt.title('Request duration of 95% of the requests')
    # show legend on plot
    plt.legend()
    # save as image
    plt.savefig('./gen_images/request_web_graph2.png')

    # Error Graph
    try:
        yresult = requests10["requests_500_duration"]
        # Amount of requests
        xresult = requests10.index.tolist()
        xresult, yresult = remove0Values(xresult, yresult)
    except:
        xresult = []
        yresult = []

    plt.figure(num='Amount of failed requests', figsize=(14, 10), dpi=100, facecolor='w', edgecolor='k')
    plt.plot(xresult, yresult, label = "Amount of failed requests", color = "red",linewidth=7.0)

    plt.gcf().autofmt_xdate()

    # Naming the x axis
    plt.xlabel('Timestamps')
    # naming the y axis
    plt.ylabel('Amount of failed reqeuests')
    # give a title
    plt.title('Amount of failed requests')
    # show legend on plot
    plt.legend()
    # save as image
    plt.savefig('./gen_images/requests_failed_web_graph2.png')
    
    """

    # function to show the plot
    plt.grid()
    plt.show()


if __name__ == '__main__':
    main(host='5.189.144.254', port='8086')

