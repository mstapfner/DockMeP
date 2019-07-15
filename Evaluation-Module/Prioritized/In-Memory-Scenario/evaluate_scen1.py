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

    """CPU Usage In-Memory-Benchmark"""
    plt.figure(num='CPU Usage In-Memory-Benchmark', figsize=(14, 10), dpi=100, facecolor='w', edgecolor='k')

    # plotting the first in-memory benchmark
    query = 'SELECT value FROM "container_cpu_user_seconds_total" WHERE "name" = \'inmemorybenchmarksingleprio\';'
    xresult, yresult = queryCPUUtil(client, query)
    plt.plot(xresult, yresult, label = "CPU Usage of In-Memory-Benchmark", color = "red",linewidth=7.0)
    plt.scatter(xresult, yresult, label = "CPU Usage of In-Memory-Benchmark", color = "red",linewidth=7.0)

    plt.gcf().autofmt_xdate()
    plt.grid()

    # Naming the x axis
    plt.xlabel('Timestamps')
    # naming the y axis
    plt.ylabel('CPU Usage in %')
    # give a title
    plt.title('CPU Usage In-Memory-Benchmark')
    # show legend on plot
    plt.legend()
    # save as image
    plt.savefig('./gen_images/cpu_usage_single.png')


    """Memory Usage Plot generation"""
    plt.figure(num='Memory Usage In-Memory-Benchmark', figsize=(14, 10), dpi=100, facecolor='w', edgecolor='k')

    # plotting the Streaming Server
    query = 'SELECT * FROM "container_memory_usage_bytes" WHERE "name" = \'inmemorybenchmarksingleprio\';'
    memXServer, memYServer = queryMemoryUsage(client, query)
    plt.plot(memXServer, memYServer, label = "Memory Usage of In-Memory-Benchmark", color="red",linewidth=7.0)
    plt.scatter(memXServer, memYServer, label = "Memory Usage of In-Memory-Benchmark", color="red",linewidth=7.0)

    plt.gcf().autofmt_xdate()

    # naming the x axis
    plt.xlabel('Timestamps')
    # naming the y axis
    plt.ylabel('Memory Usage in %')
    # give a title
    plt.title('Memory Usage In-Memory-Benchmark')
    # show legend on plot
    plt.legend()
    # save as Image
    plt.savefig('./gen_images/mem_usage_single.png')

    # function to show the plot
    plt.grid()
    plt.show()


if __name__ == '__main__':
    main(host='5.189.144.254', port='8086')

