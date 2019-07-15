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
    query = 'SELECT value FROM "container_cpu_user_seconds_total" WHERE "name" = \'inmemorydata10-1prio\';'
    xresult, yresult = queryCPUUtil(client, query)
    plt.plot(xresult, yresult, label = "CPU Usage of In-Memory-Benchmark 1", color = "red",linewidth=7.0)
    plt.scatter(xresult, yresult, label = "CPU Usage of In-Memory-Benchmark 1", color = "red",linewidth=7.0)

    # plotting the second in-memory benchmark
    query = 'SELECT value FROM "container_cpu_user_seconds_total" WHERE "name" = \'inmemorydata10-2prio\';'
    xresult2, yresult2 = queryCPUUtil(client, query)
    plt.plot(xresult2, yresult2, label = "CPU Usage of In-Memory-Benchmark 2", color = "blue",linewidth=7.0)
    plt.scatter(xresult2, yresult2, label = "CPU Usage of In-Memory-Benchmark 2", color = "blue",linewidth=7.0)

    # plotting the third in-memory benchmark
    query = 'SELECT value FROM "container_cpu_user_seconds_total" WHERE "name" = \'inmemorydata10-3prio\';'
    xresult2, yresult2 = queryCPUUtil(client, query)
    plt.plot(xresult2, yresult2, label = "CPU Usage of In-Memory-Benchmark 3", color = "green",linewidth=7.0)
    plt.scatter(xresult2, yresult2, label = "CPU Usage of In-Memory-Benchmark 3", color = "green",linewidth=7.0)

    # plotting the fourth in-memory benchmark
    query = 'SELECT value FROM "container_cpu_user_seconds_total" WHERE "name" = \'inmemorydata10-4prio\';'
    xresult2, yresult2 = queryCPUUtil(client, query)
    plt.plot(xresult2, yresult2, label = "CPU Usage of In-Memory-Benchmark 4", color = "black",linewidth=7.0)
    plt.scatter(xresult2, yresult2, label = "CPU Usage of In-Memory-Benchmark 4", color = "black",linewidth=7.0)

    # plotting the fourth in-memory benchmark
    query = 'SELECT value FROM "container_cpu_user_seconds_total" WHERE "name" = \'inmemorydata10-5prio\';'
    xresult2, yresult2 = queryCPUUtil(client, query)
    plt.plot(xresult2, yresult2, label = "CPU Usage of In-Memory-Benchmark 5", color = "red",linewidth=7.0)
    plt.scatter(xresult2, yresult2, label = "CPU Usage of In-Memory-Benchmark 5", color = "red",linewidth=7.0)

    # plotting the fourth in-memory benchmark
    query = 'SELECT value FROM "container_cpu_user_seconds_total" WHERE "name" = \'inmemorydata10-6prio\';'
    xresult2, yresult2 = queryCPUUtil(client, query)
    plt.plot(xresult2, yresult2, label = "CPU Usage of In-Memory-Benchmark 6", color = "blue",linewidth=7.0)
    plt.scatter(xresult2, yresult2, label = "CPU Usage of In-Memory-Benchmark 6", color = "blue",linewidth=7.0)

    # plotting the fourth in-memory benchmark
    query = 'SELECT value FROM "container_cpu_user_seconds_total" WHERE "name" = \'inmemorydata10-7prio\';'
    xresult2, yresult2 = queryCPUUtil(client, query)
    plt.plot(xresult2, yresult2, label = "CPU Usage of In-Memory-Benchmark 7", color = "green",linewidth=7.0)
    plt.scatter(xresult2, yresult2, label = "CPU Usage of In-Memory-Benchmark 7", color = "green",linewidth=7.0)

    # plotting the fourth in-memory benchmark
    query = 'SELECT value FROM "container_cpu_user_seconds_total" WHERE "name" = \'inmemorydata10-8prio\';'
    xresult2, yresult2 = queryCPUUtil(client, query)
    plt.plot(xresult2, yresult2, label = "CPU Usage of In-Memory-Benchmark 8", color = "black",linewidth=7.0)
    plt.scatter(xresult2, yresult2, label = "CPU Usage of In-Memory-Benchmark 8", color = "black",linewidth=7.0)

    # plotting the fourth in-memory benchmark
    query = 'SELECT value FROM "container_cpu_user_seconds_total" WHERE "name" = \'inmemorydata10-9prio\';'
    xresult2, yresult2 = queryCPUUtil(client, query)
    plt.plot(xresult2, yresult2, label = "CPU Usage of In-Memory-Benchmark 9", color = "red",linewidth=7.0)
    plt.scatter(xresult2, yresult2, label = "CPU Usage of In-Memory-Benchmark 9", color = "red",linewidth=7.0)

    # plotting the fourth in-memory benchmark
    query = 'SELECT value FROM "container_cpu_user_seconds_total" WHERE "name" = \'inmemorydata10-10prio\';'
    xresult2, yresult2 = queryCPUUtil(client, query)
    plt.plot(xresult2, yresult2, label = "CPU Usage of In-Memory-Benchmark 10", color = "blue",linewidth=7.0)
    plt.scatter(xresult2, yresult2, label = "CPU Usage of In-Memory-Benchmark 10", color = "blue",linewidth=7.0)


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
    plt.savefig('./gen_images/cpu_usage10.png')


    """Memory Usage Plot generation"""
    plt.figure(num='Memory Usage In-Memory-Benchmark', figsize=(14, 10), dpi=100, facecolor='w', edgecolor='k')

    # plotting the Streaming Server
    query = 'SELECT * FROM "container_memory_usage_bytes" WHERE "name" = \'inmemorydata10-1prio\';'
    memXServer, memYServer = queryMemoryUsage(client, query)
    plt.plot(memXServer, memYServer, label = "Memory Usage of In-Memory-Benchmark 1", color="red",linewidth=7.0)
    plt.scatter(memXServer, memYServer, label = "Memory Usage of In-Memory-Benchmark 1", color="red",linewidth=7.0)

    # plotting the second in-memory benchmark
    query = 'SELECT * FROM "container_memory_usage_bytes" WHERE "name" = \'inmemorydata10-2prio\';'
    xresult2, yresult2 = queryMemoryUsage(client, query)
    plt.plot(xresult2, yresult2, label = "Memory Usage of In-Memory-Benchmark 2", color = "blue",linewidth=7.0)
    plt.scatter(xresult2, yresult2, label = "Memory Usage of In-Memory-Benchmark 2", color = "blue",linewidth=7.0)

    # plotting the third in-memory benchmark
    query = 'SELECT * FROM "container_memory_usage_bytes" WHERE "name" = \'inmemorydata10-3prio\';'
    xresult2, yresult2 = queryMemoryUsage(client, query)
    plt.plot(xresult2, yresult2, label = "Memory Usage of In-Memory-Benchmark 3", color = "green",linewidth=7.0)
    plt.scatter(xresult2, yresult2, label = "Memory Usage of In-Memory-Benchmark 3", color = "green",linewidth=7.0)

    # plotting the fourth in-memory benchmark
    query = 'SELECT * FROM "container_memory_usage_bytes" WHERE "name" = \'inmemorydata10-4prio\';'
    xresult2, yresult2 = queryMemoryUsage(client, query)
    plt.plot(xresult2, yresult2, label = "Memory Usage of In-Memory-Benchmark 4", color = "black",linewidth=7.0)
    plt.scatter(xresult2, yresult2, label = "Memory Usage of In-Memory-Benchmark 4", color = "black",linewidth=7.0)

    # plotting the fourth in-memory benchmark
    query = 'SELECT * FROM "container_memory_usage_bytes" WHERE "name" = \'inmemorydata10-5prio\';'
    xresult2, yresult2 = queryMemoryUsage(client, query)
    plt.plot(xresult2, yresult2, label = "Memory Usage of In-Memory-Benchmark 5", color = "lightblue",linewidth=7.0)
    plt.scatter(xresult2, yresult2, label = "Memory Usage of In-Memory-Benchmark 5", color = "lightblue",linewidth=7.0)

    # plotting the fourth in-memory benchmark
    query = 'SELECT * FROM "container_memory_usage_bytes" WHERE "name" = \'inmemorydata10-6prio\';'
    xresult2, yresult2 = queryMemoryUsage(client, query)
    plt.plot(xresult2, yresult2, label = "Memory Usage of In-Memory-Benchmark 6", color = "lightgreen",linewidth=7.0)
    plt.scatter(xresult2, yresult2, label = "Memory Usage of In-Memory-Benchmark 6", color = "lightgreen",linewidth=7.0)

    # plotting the fourth in-memory benchmark
    query = 'SELECT * FROM "container_memory_usage_bytes" WHERE "name" = \'inmemorydata10-7prio\';'
    xresult2, yresult2 = queryMemoryUsage(client, query)
    plt.plot(xresult2, yresult2, label = "Memory Usage of In-Memory-Benchmark 7", color = "orange",linewidth=7.0)
    plt.scatter(xresult2, yresult2, label = "Memory Usage of In-Memory-Benchmark 7", color = "orange",linewidth=7.0)

    # plotting the fourth in-memory benchmark
    query = 'SELECT * FROM "container_memory_usage_bytes" WHERE "name" = \'inmemorydata10-8prio\';'
    xresult2, yresult2 = queryMemoryUsage(client, query)
    plt.plot(xresult2, yresult2, label = "Memory Usage of In-Memory-Benchmark 8", color = "purple",linewidth=7.0)
    plt.scatter(xresult2, yresult2, label = "Memory Usage of In-Memory-Benchmark 8", color = "purple",linewidth=7.0)

    # plotting the fourth in-memory benchmark
    query = 'SELECT * FROM "container_memory_usage_bytes" WHERE "name" = \'inmemorydata10-9prio\';'
    xresult2, yresult2 = queryMemoryUsage(client, query)
    plt.plot(xresult2, yresult2, label = "Memory Usage of In-Memory-Benchmark 9", color = "grey",linewidth=7.0)
    plt.scatter(xresult2, yresult2, label = "Memory Usage of In-Memory-Benchmark 9", color = "grey",linewidth=7.0)

    # plotting the fourth in-memory benchmark
    query = 'SELECT * FROM "container_memory_usage_bytes" WHERE "name" = \'inmemorydata10-10prio\';'
    xresult2, yresult2 = queryMemoryUsage(client, query)
    plt.plot(xresult2, yresult2, label = "Memory Usage of In-Memory-Benchmark 10", color = "yellow",linewidth=7.0)
    plt.scatter(xresult2, yresult2, label = "Memory Usage of In-Memory-Benchmark 10", color = "yellow",linewidth=7.0)

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
    plt.savefig('./gen_images/mem_usage10.png')

    # function to show the plot
    plt.grid()
    plt.show()


if __name__ == '__main__':
    main(host='5.189.144.254', port='8086')

