import matplotlib.pyplot as plt
from influxdb import InfluxDBClient
import array as arr
from datetime import datetime
import pandas as pd
import sys
sys.path.insert(0, '../../')

def main():

    # Manual measurements taken
    xresult = ["1 to 1","1 to 2","1 to 3","2 to 1","2 to 2","3 to 1"]
    yresult = [62404,73400,69167,133316,500623,76886]
    prioyresult = [60813,72815,74305,414490,78589,450198]

    font = {'family' : 'normal',
            'weight' : 'normal',
            'size'   : 16}

    plt.rc('font', **font)

    plt.figure(num='CPU-Intensive-Benchmark runtime', figsize=(14, 10), dpi=100, facecolor='w', edgecolor='k')

    # plotting the first in-memory benchmark
    plt.plot(xresult, yresult, label = "Unprioritized benchmarks", color = "blue")
    plt.scatter(xresult, yresult, label = "Unprioritized benchmarks", color = "blue")
    plt.plot(xresult, prioyresult, label = "Prioritized benchmarks", color = "red")
    plt.scatter(xresult, prioyresult, label = "Prioritized benchmarks", color = "red")

    plt.gcf().autofmt_xdate()

    # Naming the x axis
    plt.xlabel('CPU Intensive benchmarks')
    # naming the y axis
    plt.ylabel('Average runtime in milliseconds of the Data-Analytic benchmark')
    # give a title
    plt.title('CPU-Intensive-Benchmark runtime with different amounts of simultaneous containers')
    # show legend on plot
    plt.legend()
    # save as image
    plt.savefig('./gen_images/runtime_comparison_cpu.png')

    # function to show the plot
    plt.show()

if __name__ == '__main__':
    main()

