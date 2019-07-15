import matplotlib.pyplot as plt
from influxdb import InfluxDBClient
import array as arr
from datetime import datetime
import pandas as pd
import sys
sys.path.insert(0, '../../')

def main():

    # Manual measurements taken
    benchmarktimes1y = [40,60,195]
    benchmarktimes1x = [1,2,3]
    benchmarktimes2y = [120,200]
    benchmarktimes2x = [2,3]
    benchmarktimes3y = [200]
    benchmarktimes3x = [3]

    font = {'family' : 'normal',
            'weight' : 'normal',
            'size'   : 16}

    plt.rc('font', **font)

    plt.figure(num='Prioritized CPU-In-Memory benchmark runtime with different amounts of simulatenous containers', figsize=(14, 10), dpi=100, facecolor='w', edgecolor='k')

    # plotting the in-memory benchmark containers
    plt.plot(benchmarktimes1x, benchmarktimes1y, label = "Runtime of 1st In-Memory container", color = "blue",linewidth=5.0)
    plt.scatter(benchmarktimes1x, benchmarktimes1y, label = "Runtime of 1st In-Memory container", color = "blue",linewidth=5.0)
    plt.plot(benchmarktimes2x, benchmarktimes2y, label = "Runtime of 2nd In-Memory container", color = "red",linewidth=5.0)
    plt.scatter(benchmarktimes2x, benchmarktimes2y, label = "Runtime of 2nd In-Memory container", color = "red",linewidth=5.0)
    plt.plot(benchmarktimes3x, benchmarktimes3y, label = "Runtime of 3rd In-Memory container", color = "green",linewidth=5.0)
    plt.scatter(benchmarktimes3x, benchmarktimes3y, label = "Runtime of 3rd In-Memory container", color = "green",linewidth=5.0)

    plt.gcf().autofmt_xdate()

    # Naming the x axis
    plt.xlabel('Amount of simultanoues In-Memory benchmark containers')
    # naming the y axis
    plt.ylabel('Average runtime in seconds')
    # give a title
    plt.title('Prioritized CPU-In-Memory benchmark runtime with different amounts of simulatenous containers')
    # show legend on plot
    plt.legend()
    # save as image
    plt.savefig('./gen_images/benchmark_runtimes_cpuinmemory_prio.png')

    # function to show the plot
    plt.show()

if __name__ == '__main__':
    main()

