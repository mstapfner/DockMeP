import matplotlib.pyplot as plt
from influxdb import InfluxDBClient
import array as arr
from datetime import datetime
import pandas as pd
import sys
sys.path.insert(0, '../../')

def main():

    # Manual measurements taken
    benchmarktimes1y = [24,28,75,104,400,290,256]
    benchmarktimes1x = [1,2,3,4,6,8,10]
    benchmarktimes2y = [28,75,104,400,290,256]
    benchmarktimes2x = [2,3,4,6,8,10]
    benchmarktimes3y = [75,104,400,290,256]
    benchmarktimes3x = [3,4,6,8,10]
    benchmarktimes4y = [104,400,290,256]
    benchmarktimes4x = [4,6,8,10]
    benchmarktimes5y = [400,290,256]
    benchmarktimes5x = [6,8,10]
    benchmarktimes6y = [400,290,256]
    benchmarktimes6x = [6,8,10]
    benchmarktimes7y = [290,256]
    benchmarktimes7x = [8,10]
    benchmarktimes8y = [290,256]
    benchmarktimes8x = [8,10]
    benchmarktimes9y = [256]
    benchmarktimes9x = [10]
    benchmarktimes10y = [256]
    benchmarktimes10x = [10]

    font = {'family' : 'normal',
        'weight' : 'normal',
        'size'   : 16}

    plt.rc('font', **font)

    plt.figure(num='In-Memory-Benchmark runtime with different amounts of simulatenous containers', figsize=(14, 10), dpi=100, facecolor='w', edgecolor='k')

    # plotting the in-memory benchmark containers
    plt.plot(benchmarktimes1x, benchmarktimes1y, label = "Runtime of 1st In-Memory container", color = "blue",linewidth=5.0)
    plt.plot(benchmarktimes2x, benchmarktimes2y, label = "Runtime of 2nd In-Memory container", color = "red",linewidth=5.0)
    plt.plot(benchmarktimes3x, benchmarktimes3y, label = "Runtime of 3rd In-Memory container", color = "green",linewidth=5.0)
    plt.plot(benchmarktimes4x, benchmarktimes4y, label = "Runtime of 4th In-Memory container", color = "black",linewidth=5.0)
    plt.plot(benchmarktimes5x, benchmarktimes5y, label = "Runtime of 5th In-Memory container", color = "lightblue",linewidth=5.0)
    plt.plot(benchmarktimes6x, benchmarktimes6y, label = "Runtime of 6th In-Memory container", color = "orange",linewidth=5.0)
    plt.plot(benchmarktimes7x, benchmarktimes7y, label = "Runtime of 7th In-Memory container", color = "lightgreen",linewidth=5.0)
    plt.plot(benchmarktimes8x, benchmarktimes8y, label = "Runtime of 8th In-Memory container", color = "grey",linewidth=5.0)
    plt.plot(benchmarktimes9x, benchmarktimes9y, label = "Runtime of 9th In-Memory container", color = "yellow",linewidth=5.0)
    plt.plot(benchmarktimes10x, benchmarktimes10y, label = "Runtime of 10th In-Memory container", color = "purple",linewidth=5.0)

    plt.gcf().autofmt_xdate()

    # Naming the x axis
    plt.xlabel('Amount of simultanoues In-Memory benchmark containers')
    # naming the y axis
    plt.ylabel('Average runtime in seconds')
    # give a title
    plt.title('In-Memory-Benchmark runtime with different amounts of simulatenous containers')
    # show legend on plot
    plt.legend()
    # save as image
    plt.savefig('./gen_images/benchmark_runtimes.png')

    # function to show the plot
    plt.show()

if __name__ == '__main__':
    main()

