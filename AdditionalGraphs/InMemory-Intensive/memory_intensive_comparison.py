import matplotlib.pyplot as plt
from influxdb import InfluxDBClient
import array as arr
from datetime import datetime
import pandas as pd
import sys
sys.path.insert(0, '../../')

def main():

    unprioy = [24,56,225,416,2000,1680,2560]
    unpriox = [1,2,3,4,6,8,10]
    prioy = [40,120,215,360,910,2733,3052]
    priox = [1,2,3,4,6,8,10]

    font = {'family' : 'normal',
            'weight' : 'normal',
            'size'   : 16}

    plt.rc('font', **font)

    plt.figure(num='Comparison of the prioritized and unprioritized benchmark times of the In-Memory-Benchmark', figsize=(14, 10), dpi=100, facecolor='w', edgecolor='k')

    plt.plot(unpriox, unprioy, label = "Overall runtime of unprioritized benchmarks", color = "blue",linewidth=5.0)
    plt.plot(priox, prioy, label = "Overall runtime of prioritized benchmarks", color = "red",linewidth=5.0)

    plt.gcf().autofmt_xdate()

    # Naming the x axis
    plt.xlabel('Amount of simultanoues In-Memory benchmark containers')
    # naming the y axis
    plt.ylabel('Runtime in seconds')
    # give a title
    plt.title('Comparison of the prioritized and unprioritized benchmark times of the In-Memory-Benchmark')
    # show legend on plot
    plt.legend()
    # save as image
    plt.savefig('./gen_images/benchmark_runtime_comparison.png')

    # function to show the plot
    plt.show()

if __name__ == '__main__':
    main()

