import matplotlib.pyplot as plt
from influxdb import InfluxDBClient
import array as arr
from datetime import datetime
import pandas as pd
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
    plt.figure(num='CPU Usage CPU-In-Memory-Benchmark', figsize=(14, 10), dpi=100, facecolor='w', edgecolor='k')

    # plotting the first in-memory benchmark
    query = 'SELECT value FROM "container_cpu_user_seconds_total" WHERE "name" = \'inmemorycpu1\';'
    xresult, yresult = queryCPUUtil(client, query)
    plt.plot(xresult, yresult, label = "CPU Usage of the In-Memory Benchmark 1", color = "red",linewidth=7.0)
    plt.scatter(xresult, yresult, label = "CPU Usage of the In-Memory Benchmark 1", color = "red",linewidth=7.0)

    # plotting the first in-memory benchmark
    query = 'SELECT value FROM "container_cpu_user_seconds_total" WHERE "name" = \'graphanalyticcpu1\';'
    xresult, yresult = queryCPUUtil(client, query)
    plt.plot(xresult, yresult, label = "CPU Usage of the Graph-Analytic Benchmark 1", color = "blue",linewidth=7.0)
    plt.scatter(xresult, yresult, label = "CPU Usage of the Graph-Analytic Benchmark 1", color = "blue",linewidth=7.0)

    plt.gcf().autofmt_xdate()
    plt.grid()

    # Naming the x axis
    plt.xlabel('Timestamps')
    # naming the y axis
    plt.ylabel('CPU Usage in %')
    # give a title
    plt.title('CPU Usage CPU-In-Memory-Benchmark 1')
    # show legend on plot
    plt.legend()
    # save as image
    plt.savefig('./gen_images/cpu_inmemory_cpu1.png')


    """Memory Usage Plot generation"""
    plt.figure(num='Memory Usage CPU-In-Memory-Benchmark', figsize=(14, 10), dpi=100, facecolor='w', edgecolor='k')

    # plotting the Streaming Server
    query = 'SELECT * FROM "container_memory_usage_bytes" WHERE "name" = \'inmemorycpu1\';'
    memXServer, memYServer = queryMemoryUsage(client, query)
    plt.plot(memXServer, memYServer, label = "Memory Usage of the In-Memory 1", color="red",linewidth=7.0)
    plt.scatter(memXServer, memYServer, label = "Memory Usage of the In-Memory 1", color="red",linewidth=7.0)

    # plotting the Streaming Server
    query = 'SELECT * FROM "container_memory_usage_bytes" WHERE "name" = \'graphanalyticcpu1\';'
    memXServer, memYServer = queryMemoryUsage(client, query)
    plt.plot(memXServer, memYServer, label = "Memory Usage of the Graph-Analytic 1", color="blue",linewidth=7.0)
    plt.scatter(memXServer, memYServer, label = "Memory Usage of the Graph-Analytic 1", color="blue",linewidth=7.0)

    plt.gcf().autofmt_xdate()
    plt.grid()

    # naming the x axis
    plt.xlabel('Timestamps')
    # naming the y axis
    plt.ylabel('Memory Usage in %')
    # give a title
    plt.title('Memory Usage CPU-In-Memory-Benchmark 1')
    # show legend on plot
    plt.legend()
    # save as Image
    plt.savefig('./gen_images/mem_inmemory_cpu1.png')


    # function to show the plot
    plt.show()

if __name__ == '__main__':
    main(host='5.189.144.254', port='8086')

