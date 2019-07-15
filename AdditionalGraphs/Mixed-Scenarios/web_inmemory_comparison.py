import matplotlib.pyplot as plt
from influxdb import InfluxDBClient
import array as arr
from datetime import datetime
import pandas as pd
import sys
sys.path.insert(0, '../../')

def main():

    unprioy = [55,150,540]
    unpriox = [1,2,3]
    prioy = [25,110,474]
    priox = [1,2,3]

    font = {'family' : 'normal',
            'weight' : 'normal',
            'size'   : 16}

    plt.rc('font', **font)

    plt.figure(num='Comparison of the prioritized and unprioritized In-Memory benchmark times of the Web-In-Memory-Benchmark', figsize=(14, 10), dpi=100, facecolor='w', edgecolor='k')

    plt.plot(unpriox, unprioy, label = "Overall runtime of unprioritized benchmarks", color = "blue",linewidth=5.0)
    plt.plot(priox, prioy, label = "Overall runtime of prioritized benchmarks", color = "red",linewidth=5.0)

    plt.gcf().autofmt_xdate()

    # Naming the x axis
    plt.xlabel('Amount of simultanoues In-Memory benchmark containers')
    # naming the y axis
    plt.ylabel('Runtime in seconds')
    # give a title
    plt.title('Comparison of the prioritized and unprioritized In-Memory benchmark times of the Web-In-Memory-Benchmark')
    # show legend on plot
    plt.legend()
    # save as image
    plt.savefig('./gen_images/benchmark_runtime_webinmemory_comparison.png')

    # function to show the plot
    plt.show()

if __name__ == '__main__':
    main()

